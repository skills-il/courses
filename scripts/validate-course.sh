#!/usr/bin/env bash
# Stub validator - Task 5 will replace this with the full implementation.
set -euo pipefail
COURSE_DIR="${1:?usage: validate-course.sh <course-slug>}"
[ -d "$COURSE_DIR" ] || { echo "Course dir not found: $COURSE_DIR" >&2; exit 1; }
echo "validate-course.sh: stub OK for $COURSE_DIR"
