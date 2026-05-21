#!/usr/bin/env bash
# validate-course.sh - enforces schema and security gates from spec §5.7.
set -euo pipefail

COURSE_DIR="${1:?usage: validate-course.sh <course-slug>}"
[ -d "$COURSE_DIR" ] || { echo "ERROR: course dir not found: $COURSE_DIR" >&2; exit 1; }

command -v jq >/dev/null || { echo "ERROR: jq required" >&2; exit 1; }

ERRORS=()
err() { ERRORS+=("$1"); echo "FAIL: $1" >&2; }

cd "$COURSE_DIR"

# Required files
for f in SKILL.md SKILL_HE.md metadata.json evidence.json CHANGELOG.md; do
  [ -f "$f" ] || err "$f missing"
done

[ ${#ERRORS[@]} -gt 0 ] && { echo "Aborting: missing required files" >&2; exit 1; }

# metadata.json schema
jq -e '.type == "course"' metadata.json >/dev/null \
  || err 'metadata.json: type must be "course"'
jq -e '.name | test("^[a-z0-9][a-z0-9-]*$")' metadata.json >/dev/null \
  || err "metadata.json: name must be kebab-case"
jq -e '.version | test("^[0-9]+\\.[0-9]+\\.[0-9]+$")' metadata.json >/dev/null \
  || err "metadata.json: version must be semver MAJOR.MINOR.PATCH"
jq -e '.display_name.he and .display_name.en' metadata.json >/dev/null \
  || err "metadata.json: display_name.he and .en required"
jq -e '(.chapters | length) > 0' metadata.json >/dev/null \
  || err "metadata.json: chapters[] must be non-empty"
jq -e '(.recommended_skills | length) > 0' metadata.json >/dev/null \
  || err "metadata.json: recommended_skills[] must be non-empty (catalog coupling test)"

# Slug identity (Fix #3): folder name == metadata.name
FOLDER_SLUG=$(basename "$(pwd)")
META_NAME=$(jq -r '.name' metadata.json)
[ "$FOLDER_SLUG" = "$META_NAME" ] \
  || err "slug mismatch: folder='$FOLDER_SLUG' but metadata.name='$META_NAME'"

# Chapter slug uniqueness (Fix #4)
DUPES=$(jq -r '.chapters[].slug' metadata.json | sort | uniq -d)
[ -z "$DUPES" ] || err "chapter slugs not unique: $DUPES"

# Chapter heading count matches manifest
EN_HEADINGS=$(grep -c '^## Chapter [0-9]\+:' SKILL.md || true)
HE_HEADINGS=$(grep -c '^## פרק [0-9]\+:' SKILL_HE.md || true)
EXPECTED=$(jq '.chapters | length' metadata.json)
[ "$EN_HEADINGS" -eq "$EXPECTED" ] \
  || err "SKILL.md has $EN_HEADINGS '## Chapter N:' headings, expected $EXPECTED"
[ "$HE_HEADINGS" -eq "$EXPECTED" ] \
  || err "SKILL_HE.md has $HE_HEADINGS '## פרק N:' headings, expected $EXPECTED"

# Image references exist
for img in $(grep -oE '!\[[^]]*\]\([^)]+\)' SKILL.md SKILL_HE.md 2>/dev/null | grep -oE '\([^)]+\)' | tr -d '()'); do
  case "$img" in
    http*|/*) continue ;;
  esac
  [ -f "$img" ] || err "referenced image not found: $img"
done
if [ -n "$(jq -r '.cover_image // empty' metadata.json)" ]; then
  COVER=$(jq -r '.cover_image' metadata.json)
  [ -f "$COVER" ] || err "cover_image not found: $COVER"
fi

# CHANGELOG.md format (Fix #2): every ## header matches the exact regex.
# Note: the em dash (U+2014) in the regex below is intentional per spec §5.6,
# which requires the machine-parsed format '## X.Y.Z — YYYY-MM-DD'.
BAD=$(grep '^## ' CHANGELOG.md | grep -vE '^## [0-9]+\.[0-9]+\.[0-9]+ — [0-9]{4}-[0-9]{2}-[0-9]{2}$' || true)
[ -z "$BAD" ] \
  || err "CHANGELOG.md: malformed version headers (expected '## X.Y.Z — YYYY-MM-DD'): $BAD"

# Top entry's version equals metadata.version
TOP_VER=$(grep -E '^## [0-9]' CHANGELOG.md | head -n1 | awk '{print $2}')
META_VER=$(jq -r '.version' metadata.json)
[ "$TOP_VER" = "$META_VER" ] \
  || err "CHANGELOG.md top entry version='$TOP_VER' but metadata.version='$META_VER'"

# evidence.json covers extractable claims
EVIDENCE_COUNT=$(jq -r '.claims | length' evidence.json)
[ "$EVIDENCE_COUNT" -ge "$EXPECTED" ] \
  || err "evidence.json has $EVIDENCE_COUNT claims, expected at least $EXPECTED (one per chapter minimum)"

CLAIM_PATTERNS=$(grep -oE '(₪[0-9,]+|[0-9]+(\.[0-9]+)?%|טופס [0-9]+|form [0-9]+)' SKILL.md SKILL_HE.md 2>/dev/null | sort -u || true)
if [ -n "$CLAIM_PATTERNS" ] && [ "$EVIDENCE_COUNT" -lt 3 ]; then
  err "SKILL.md has extractable claims but evidence.json has only $EVIDENCE_COUNT entries"
fi

# scripts/ Tank code scan (Fix #5) - if scripts/ exists, note for sync-time scan
if [ -d scripts ]; then
  echo "Note: scripts/ present, will be scanned by Tank code ruleset at sync time"
fi

if [ ${#ERRORS[@]} -gt 0 ]; then
  echo "" >&2
  echo "Validation FAILED with ${#ERRORS[@]} error(s)." >&2
  exit 1
fi

echo "Validation PASSED for $FOLDER_SLUG"
