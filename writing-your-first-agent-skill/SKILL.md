---
name: writing-your-first-agent-skill
description: A 6-chapter course for developers on how to write a Claude agent skill from scratch, ship it to the skills-il catalog, and avoid the 10 most common rejection reasons. Anchored to the skills-il/ folder layout and the Anthropic Claude Skills spec.
license: MIT
---

# Writing Your First Agent Skill

Most developers who ship a skill for the first time end up with one of two outcomes: a tiny, focused, useful skill that gets installed quickly, or a sprawling 2000-word SKILL.md that the LLM never loads because the description is too vague. The difference is not effort. It is understanding what the skill actually IS to the LLM at routing time, and what the spec lets you say.

This course is for developers who can write code but have not yet authored an agent skill, or have written one and want to understand WHY some skills get picked up by Claude / Cursor / Windsurf and others sit in the catalog unused. Six chapters. Real examples from the skills-il catalog. By the end you will have shipped a skill of your own (or have a clear plan for the one you are about to write).

## Course Overview

| Chapter | What you walk away with |
|---|---|
| 1. What is a skill, really? | The mental model: skill vs MCP vs system prompt vs CLI, and when each fits |
| 2. Anatomy of a great SKILL.md | The 3 frontmatter fields, the description as routing input, and the "Use when / Do NOT use for" pattern |
| 3. metadata.json + bilingual content | The skills-il extension: display fields, bilingual tags, SKILL_HE.md companion |
| 4. references/ vs scripts/ | When to use each, with worked examples from real skills |
| 5. Publishing to the skills-il catalog | End-to-end: scaffold → push → sync → trust score |
| 6. The 10-minute pre-publish checklist | The 10 most common rejection reasons and how to avoid them |

This course assumes you have basic familiarity with git, Markdown, and JSON. No prior experience with Claude Skills required.

For the workflow tool that scaffolds a new skill (interactive Q&A → folder layout → frontmatter), install `skills-il-skill-creator` (`npx skills-il add developer-tools/skills-il-skill-creator`). The course teaches the concepts; that skill executes the scaffold. They are designed to pair.

## Chapter 1: What is a skill, really?

A Claude agent skill is the smallest unit of LLM behavior modification you can ship: a single Markdown file with YAML frontmatter, optionally accompanied by reference files and executable scripts, that the LLM reads on demand when its description matches the user's request. That is the entire model. Everything else (catalog, sync pipeline, trust score, install counts) is infrastructure around that one file.

### The four-way comparison: skill vs MCP vs system prompt vs CLI

![Skill vs MCP vs system prompt vs CLI](skill-vs-mcp-vs-cli.png)

It is easier to understand what a skill IS by understanding what it is NOT.

| Tool | What it is | When you'd write one |
|---|---|---|
| **Agent skill** | A Markdown file the LLM reads on demand to learn how to handle a specific task type | You want the LLM to know HOW to do something without you having to repeat the instructions in every conversation |
| **MCP server** | A network service the LLM calls to get live data or perform stateful operations | You need the LLM to read or write external state (a database, an API, a file system) |
| **System prompt** | Persistent instructions injected at conversation start | You want behavior that applies to ALL of an assistant's interactions, not just task-specific |
| **CLI tool** | A program a human runs directly | The user knows the exact command they want to run; no natural-language routing needed |

A common confusion: people write a skill when they actually need an MCP. If your "skill" boils down to "the LLM should call this API and return the JSON," that is an MCP server, not a skill. Skills are for HOW to do something (decision rules, structure, judgment); MCPs are for accessing live state.

A second common confusion: people write a skill when they actually need a system prompt. If you want Claude to always speak in your brand voice across every conversation, that is a system prompt or a custom GPT, not a skill. Skills are loaded ON DEMAND when the user's intent matches the skill's description.

### The Anthropic Claude Skills spec, in one paragraph

Every skill is a folder containing at minimum a `SKILL.md` file with YAML frontmatter. The frontmatter requires two fields per the Anthropic spec, `name` (kebab-case slug) and `description` (one or two sentences the LLM reads to decide whether to load the skill), plus `license` which is conventional in the skills-il catalog (typically MIT but technically optional in the upstream spec). The body is plain Markdown, loaded into the LLM's context once the skill is invoked. Optionally the folder can contain a `references/` subfolder (static files the LLM reads when needed) and a `scripts/` subfolder (executable code the agent's shell tool can run). That is the entire spec. Everything in the skills-il catalog is a superset of this.

### The skills-il extension: metadata.json and bilingual content

The Anthropic spec is minimal. The skills-il catalog needs more: bilingual display names, audience and level tags, supported-agent lists, install commands. To avoid conflicting with the Anthropic spec, skills-il puts this in a separate file called `metadata.json` alongside SKILL.md. The Hebrew companion content lives in a parallel file called `SKILL_HE.md`. Chapter 3 covers both in detail.

### When NOT to write a skill (the decision tree)

Before you write a single line of SKILL.md, run this check:

- **Does the LLM already do this well without a skill?** If you ask Claude "format this Israeli phone number" and it does it correctly on the first try, you do not need a phone-formatter skill. Skills are for cases where the default behavior is wrong, incomplete, or culturally tone-deaf.
- **Does the task require live data?** If the answer changes hourly (stock prices, government API responses, traffic), the skill is the wrong abstraction. Write an MCP server.
- **Is the task purely computational with a single right answer?** A simple checksum or format converter might be better as a one-line scripts/ entry called from inside a larger skill, not as its own skill.
- **Are you sure the audience needs it?** Skills that have under 5 installs after 6 months tend to die in the catalog. Talk to 3 prospective users before writing.

The most common mistake in Chapter 1: writing a skill where an MCP would fit better. Symptom: your skill's body is mostly "call this URL, parse this JSON, return this field." Fix: convert to an MCP server with a single tool, register it in the directory, and your "skill" becomes a one-line MCP invocation.

If your topic survives the decision tree, install the `skills-il-skill-creator` skill (`npx skills-il add developer-tools/skills-il-skill-creator`) to scaffold the folder layout, then continue with Chapter 2 to learn what to put in SKILL.md.

## Chapter 2: Anatomy of a great SKILL.md

A great SKILL.md does three things at once: it tells the LLM when to load itself (the description), it teaches the LLM how to perform the task (the body), and it gives the LLM enough examples to handle edge cases without escalating to the user. If any of these three are missing, the skill either does not get loaded (description failure), does the wrong thing (body failure), or asks the user too many clarifying questions (examples failure).

### The frontmatter fields

![SKILL.md anatomy with callouts](skill-md-anatomy.png)

```yaml
---
name: israeli-id-validator
description: Validate Israeli national ID numbers (תעודת זהות) using the Luhn-style check-digit algorithm. Use when a user pastes a 9-digit ID and asks "is this valid", or when generating sample IDs for testing. Do NOT use for foreign passport numbers or business registration numbers.
license: MIT
---
```

- **`name`** must be kebab-case, must match the folder name exactly, and is the slug the LLM uses to identify the skill internally. Pick something specific: `israeli-id-validator`, not `id-tools`. Required by the spec.
- **`description`** is the single most important field in your skill. In hosts that use description-based routing (Claude Code's skill discovery is the canonical case), the LLM reads primarily this field to decide whether to load the skill into context. In other hosts the user explicitly picks the skill from a list, but the description is still what the LLM sees first. Treat it as both marketing copy and a routing specification. Required by the spec.
- **`license`** is typically `MIT`. The Anthropic upstream spec treats license as conventional rather than strictly required, but the skills-il catalog and most ecosystem tooling expect it. Include it.

### The description is the routing input

In hosts that auto-discover skills by description (Claude Code is the canonical case), the LLM scans the descriptions of available skills to decide which (if any) to load. It does NOT read the body. It does NOT read the `references/`. It reads only the description. In hosts where the user explicitly picks a skill from a list (Claude Desktop, some Cursor flows), the description is still the user-facing summary that determines whether they click. Either way, the description has to:

1. Name the task clearly (in both languages of the term, if there's an Israeli-context name)
2. Trigger on the natural-language patterns a user would actually use
3. Exclude cases that look similar but require a different skill

The "Use when..." and "Do NOT use for..." patterns make this concrete:

> "Validate Israeli national ID numbers (תעודת זהות) using the Luhn-style check-digit algorithm. Use when a user pastes a 9-digit ID and asks 'is this valid', or when generating sample IDs for testing. Do NOT use for foreign passport numbers or business registration numbers."

The "Do NOT" clause is critical. Without it, the LLM might load this skill when the user asks about a Romanian passport, then try to apply the Israeli check-digit algorithm and fail confusingly. With the "Do NOT" clause, the LLM correctly routes elsewhere.

### Body structure: scope, rules, examples, anti-patterns

The body is what the LLM reads after deciding to load the skill. It needs four sections, in roughly this order:

1. **Scope** (one paragraph): what exactly this skill covers, restated more precisely than the description allowed.
2. **Decision rules** (the meat): the if-then logic the LLM should apply. Use bulleted lists, decision trees, or worked examples. Avoid prose.
3. **Worked examples** (mandatory): show the input, the reasoning, and the output. Cover the typical case and at least one edge case. Without worked examples, the LLM hallucinates the boundary behavior.
4. **Anti-patterns** (recommended): tell the LLM what NOT to do, even if it sounds tempting. Anti-patterns prevent failure modes that would otherwise look correct.

### Study example: `israeli-id-validator`

Install `israeli-id-validator` (`npx skills-il add developer-tools/israeli-id-validator`) and read the SKILL.md. It is a small focused skill (~150 lines) with a clear scope, a deterministic algorithm in scripts/, and concrete worked examples. It is the cleanest reference for "what a small first-skill should look like."

The most common mistake in Chapter 2: writing a description that is too vague. "A skill for Israeli things" gets loaded for every Israeli-context conversation and does nothing useful for any of them. Pick ONE task. Name it specifically. Add the "Use when..." and "Do NOT use for..." patterns.

## Chapter 3: metadata.json + bilingual content (the skills-il extension)

The Anthropic Claude Skills spec covers `SKILL.md` and the optional `references/` + `scripts/` subfolders. The skills-il catalog needs more: bilingual display names, audience tags, supported-agent lists, install commands, version tracking. Instead of expanding the YAML frontmatter (which would conflict with the upstream spec and break Claude Desktop's strict YAML parser), skills-il puts this metadata in a separate file: `metadata.json`. The Hebrew companion content lives in a parallel file: `SKILL_HE.md`.

### Why metadata.json instead of nested YAML

Claude Desktop's strict YAML parser rejected the nested `metadata:` key that skills-il originally used inside the SKILL.md frontmatter, refusing to load the skill at all. The fix was to pull everything skills-il-specific into a separate `metadata.json` file alongside SKILL.md. Now Claude Desktop (which reads SKILL.md frontmatter only) loads cleanly, and the skills-il catalog pipeline (which reads metadata.json) gets the bilingual + cataloging data it needs. The frontmatter stays minimal: `name`, `description`, `license`, and that is it.

### metadata.json fields

![metadata.json structure with key fields](metadata-json-structure.png)

```json
{
  "name": "israeli-id-validator",
  "version": "1.2.0",
  "license": "MIT",
  "display_name": {
    "he": "מאמת תעודת זהות",
    "en": "Israeli ID Validator"
  },
  "display_description": {
    "he": "אמתו תעודת זהות ישראלית בעזרת אלגוריתם ספרת הביקורת. שמיש לטפסים, נתוני בדיקה, וזיהוי תעודות לא תקינות לפני שליחה.",
    "en": "Validate Israeli national ID numbers using the check-digit algorithm. Useful for forms, test data, and catching bad IDs before submission."
  },
  "audience": "developers",
  "level": "beginner",
  "tags": {
    "he": ["תעודת זהות", "אימות", "ישראל"],
    "en": ["israeli-id", "validation", "checksum"]
  },
  "supported_agents": ["claude-code", "cursor", "windsurf", "claude-desktop"]
}
```

- **`display_name`** is the bilingual title shown in the catalog UI. Hebrew first.
- **`display_description`** is the bilingual marketing copy. The Hebrew version must read like native Hebrew, not a translation (Chapter 6 expands).
- **`audience`** is one of: `developers`, `non-technical`, `professionals`, `mixed`. Picks the catalog filter and the default writing register.
- **`level`** is one of: `beginner`, `intermediate`, `advanced`.
- **`tags`** must have parallel Hebrew + English arrays. The catalog filters on the English tags; the Hebrew array is for display in the Hebrew UI.
- **`supported_agents`** must use canonical slugs: `claude-code` (not `claude`), `gemini-cli` (not `gemini`), `cursor`, `windsurf`, `claude-desktop`. Wrong slugs render as empty gray icon circles on skill cards (there is no sync-time validation for this; check your card on dev before pushing).

### SKILL_HE.md: the Hebrew companion

Every skills-il skill ships a Hebrew translation called `SKILL_HE.md` next to `SKILL.md`. The two files share the same YAML frontmatter shape (with Hebrew description text), the same body structure (chapter headings translated), and the same image references.

Hebrew naturalness is the single biggest quality differentiator between top-installed skills and the long tail. The most common mistake here is to write SKILL.md, run it through an LLM translator, paste the output into SKILL_HE.md, and ship. The result reads as transliterated English: word order is wrong, calques abound ("שכבת האסטרטגיה" for "the strategy layer", "שתי שאלות עוגן" for "two anchor questions"), and gender disagreements appear ("זו לא ייעוץ" should be "זה לא ייעוץ"). Israeli readers detect this instantly.

The fix: after the LLM-generated first draft, have a native Israeli Hebrew speaker (or a dedicated rewriter pass) edit for naturalness. Reference the style of `כל זכות` plain-language entries, TheMarker explainers, or popular Israeli blogs in your domain.

### Cross-referencing other skills in Hebrew prose

When your SKILL_HE.md body needs to reference another skill (e.g., to recommend a related skill the user might also want), use the Hebrew display name followed by the slug in parens, NOT the bare kebab-case slug in backticks. Example:

- Wrong (Hebrew): `התקינו את הסקיל israeli-pension-advisor`
- Right (Hebrew): `התקינו את הסקיל יועץ פנסיה ישראלי (israeli-pension-advisor)`

The right form keeps the Hebrew reading flow intact while preserving the machine-readable slug for the catalog's coupling check. English content uses the bare-backticked-slug convention; only Hebrew needs the display-name-plus-slug treatment.

### Study example: `hebrew-seo-geo-toolkit`

Install `hebrew-seo-geo-toolkit` (`npx skills-il add marketing-growth/hebrew-seo-geo-toolkit`) and compare its SKILL.md, SKILL_HE.md, and metadata.json. It is a high-installs (220+) bilingual skill that has been iterated based on user feedback. The Hebrew description reads natural, the tags are properly parallel, and the body covers Israeli-specific SEO and GEO concerns that no generic SEO tool would handle. It is the reference for "what a high-quality bilingual skill looks like."

The most common mistake in Chapter 3: literal English-to-Hebrew translation that reads broken to Israeli readers. The fix: write SKILL_HE.md as if it were the original, not the translation. Hebrew first thinking produces dramatically better skills.

## Chapter 4: references/ vs scripts/ (when to use which)

A skill folder can include two optional subfolders: `references/` and `scripts/`. They serve different purposes and choosing the wrong one is a frequent rejection reason. The rule is simple: `references/` for static content the LLM reads, `scripts/` for executable code the LLM runs. The hard part is recognizing which side of the line your content falls on.

### references/: static files the LLM reads on demand

`references/` holds files the LLM can READ when it needs them: markdown explanations, JSON lookup tables, sample data, template files, image specifications. The LLM reads these via a file-read tool; it does not execute them.

Typical uses:

- **Lookup tables**: an array of Israeli area codes mapped to cities, stored as JSON, referenced when the LLM needs to identify a phone number's origin
- **Long-form reference content**: a 2000-word explanation of the Israeli tax filing process, kept out of SKILL.md (which should stay short and routing-focused) and pulled in only when the LLM hits a specific question
- **Templates**: sample contracts, sample forms, boilerplate the LLM customizes for the user
- **Image specs**: prompts for generating illustrations, kept separate from the body

A good `references/` entry is something the LLM needs only sometimes, where loading it into context up-front would waste tokens.

### scripts/: executable code the LLM CAN run

`scripts/` holds code the agent can EXECUTE: validators, parsers, deterministic computations, network calls. The agent invokes scripts via the host's shell tool (Bash in Claude Code, the equivalent in other hosts), reads stdout/stderr, and incorporates the parsed output into its response. There is no built-in "function-call" mechanism for scripts in the Skills spec; scripts are plain executables the agent runs and reads.

Typical uses:

- **Deterministic computation the LLM should not redo**: a Luhn check-digit algorithm for Israeli IDs (the LLM would re-derive it inconsistently otherwise)
- **Parsers**: a function that takes a raw Israeli payslip text and returns a structured JSON breakdown
- **External lookups requiring an API key**: a function that calls a government API to look up business registration info
- **Network calls**: scraping a public table, hitting an RSS feed

Scripts must be self-contained (declare all dependencies in the script header), include a clear usage comment at the top, and write to stdout in a predictable format the LLM can parse.

### The decision tree

![Decision tree: references vs scripts](references-vs-scripts-tree.png)

When you have content that supports your skill, ask:

1. **Is it deterministic computation the LLM might re-derive wrong?** → `scripts/`
2. **Does it require an API key, network call, or filesystem write?** → `scripts/`
3. **Is it a static lookup, template, or long-form explanation the LLM needs only sometimes?** → `references/`
4. **Is it a brief, always-relevant rule or example?** → Inline in `SKILL.md` body
5. **Is it a long, always-relevant rule the LLM must always know?** → Probably should not be in a skill; consider a system prompt or a different skill that covers it

### File size and structure

Keep `references/` files under 5000 words each (~20KB). If you need more, split into multiple files and let the LLM pick the right one. `scripts/` files should be self-contained: a single script under ~200 lines is easy to maintain; anything larger should probably be split or become a real package.

Avoid:

- Pasting a 50-row lookup table into the SKILL.md body. Move it to `references/<table-name>.json` and reference it from the body ("see references/area-codes.json").
- Writing a Python script inside SKILL.md's body as a code fence. Move it to `scripts/<name>.py` and reference it.
- Putting binary files (PNG, ZIP) in `references/` unless they are sample data the LLM specifically inspects. Catalog images live in the website monorepo, not the skill folder.

### Study example: `israeli-id-validator`'s scripts/

The `israeli-id-validator` skill (`npx skills-il add developer-tools/israeli-id-validator`) ships a small TypeScript file in `scripts/` that implements the Luhn check-digit algorithm for Israeli national IDs. The body of SKILL.md describes when to use the algorithm; the actual deterministic math lives in the script. That is the textbook example of "deterministic compute belongs in scripts/."

For a contrasting example, install `israeli-phone-formatter` (`npx skills-il add developer-tools/israeli-phone-formatter`) and study how it uses `references/` to store the lookup table of Israeli prefixes (mobile, landline, special-service) without inlining them into the body.

The most common mistake in Chapter 4: pasting a long lookup table into the SKILL.md body instead of `references/`. Symptom: the body is 80 percent table and 20 percent actual decision rules. Fix: move the table to a JSON file in `references/` and reference it from the body. Token efficiency improves, and the body becomes readable as decision logic again.

## Chapter 5: Publishing to the skills-il catalog

You have written SKILL.md, SKILL_HE.md, metadata.json, and (optionally) references/ and scripts/. The skill works locally when you install it with `npx skills-il add <category>/<slug>`. Now you need to actually publish it to the catalog. This chapter walks the end-to-end publication flow.

### Step 1: Pick the right category repo

![Publication flow: scaffold to trust score](publication-flow.png)

skills-il organizes skills into 12 category repositories under the `skills-il` GitHub organization. Each repo is a separate npm-publishable directory:

| Category | When to use |
|---|---|
| `tax-and-finance` | Israeli taxes, pension, bituach leumi, banking |
| `developer-tools` | Validators, formatters, scaffolders, dev utilities |
| `government-services` | Forms, agency interactions, official processes |
| `legal-tech` | Contracts, compliance, regulations |
| `security-compliance` | Security audits, GDPR / Amendment 13 compliance |
| `communication` | Email, social, messaging |
| `marketing-growth` | SEO, ads, content strategy |
| `accounting` | Bookkeeping, payroll, financial reports |
| `food-and-dining` | Restaurants, kashrut, food delivery |
| `health-services` | HMOs, sal briut, health navigation |
| `education` | Learning resources, exam prep |
| `localization` | Hebrew NLP, translation, dates, units |

Pick the single category that BEST fits. If a skill spans two categories, pick the one users would search first, not the one with more skills.

### Step 2: Scaffold via skills-il-skill-creator

Run `skills-il-skill-creator` (you should already have it installed from Chapter 1's recommendation). It walks you through category selection, slug naming, SKILL.md frontmatter, metadata.json generation, Hebrew companion stub, and folder layout. The output is a complete folder ready to commit.

### Step 3: Local validation before push

Before pushing, sanity-check your skill folder against the publication rules. The category repo's CI runs a validator; running the equivalent checks locally first saves a round-trip. The minimum checklist:

- YAML frontmatter has `name`, `description`, and `license`; no nested keys
- `metadata.json` is valid JSON (`jq -e . metadata.json`) and matches the skills-il catalog schema
- `SKILL.md` and `SKILL_HE.md` have parallel section structure (same chapter headings translated)
- No em dashes anywhere (grep all three files for the em-dash character U+2014; output must be empty)
- `name` field equals the folder basename (`jq -r '.name' metadata.json` matches `basename "$(pwd)"`)
- Every file referenced in SKILL.md from `references/` or `scripts/` actually exists in the folder

The category repos' CI runs the canonical validator. If yours has a validator script committed (e.g., `scripts/validate-skill.sh`), run it. Otherwise the checks above are enough to catch most rejection patterns.

### Step 4: Push to the category repo + open PR

For community contributors: fork the category repo, push your skill folder to a feature branch, and open a pull request. The skills-il maintainers review and merge.

For org members with direct access: push to master on the category repo. Branch protection requires PR review by default; the admin role can bypass for routine additions.

### Step 5: Sync pipeline picks up the new skill

The sync pipeline (`pnpm sync-skills` in the skills-il frontend) runs on a daily cron AND on-demand via GitHub Actions. It walks each category repo, reads SKILL.md + metadata.json, and upserts each skill into the catalog Supabase database. On first sync, your skill appears in the catalog with `is_published=false`.

### Step 6: Admin publishes the skill via the admin dashboard

`is_published` flips to true through the admin dashboard (or via `PATCH /v1/admin/skills/<slug>` with the right Supabase JWT). The admin reviews the catalog entry, the trust score, the auto-generated content (enriched-content fields are populated by a separate enrichment pass), and confirms or rejects publication.

### Step 7: Trust score pipeline rates your skill

In parallel with publication, a trust-score pipeline scans your GitHub repo and the skill folder for signals across three tiers:

- **Critical (5 signals)**: spec compliant, secret scanning enabled, code scanning enabled, signed release, license SPDX-recognizable
- **Recommended (8 signals)**: tag protection, branch protection, signed commits, SECURITY.md, MFA enforced, CODEOWNERS, dependabot clean, semver matches tag
- **Bonus (2 signals)**: latest release age under 180 days, tree SHA matches HEAD

All 5 critical passing earns the "Verified" badge and a trust tier of `verified`. Failing any critical drops you to `trusted`, `basic`, or `unverified`. The bonus tier gives up to 10 points on top.

Most first-time contributors land at `basic` or `unverified` because they have not enabled secret scanning or signed their releases. The fix is straightforward: enable secret scanning + push protection in your repo settings, then tag your release with `git tag v1.0.0 && git push --tags` to trigger the signed-release workflow.

### Step 8: Iterate (version bumps, changelog flow)

When you update your skill, bump `version` in metadata.json following semver (patch / minor / major). The sync pipeline picks up the new version on its next run. The catalog's "what's new" section and follower notifications are driven by the `skill_updates` database table, populated by the admin `update-skill` flow rather than by a per-skill `CHANGELOG.md` file; skills do not need to ship a CHANGELOG.md (courses do, skills do not). If you want a local change log for your own tracking, a `CHANGELOG.md` is fine but not required.

Forgetting to bump the version when shipping changes is a common publication mistake. The sync pipeline doesn't refuse the push (it just upserts whatever content is in the file), but the catalog's "version" indicator stays stale and the `update-skill` admin flow has nothing new to fan out to followers.

The most common mistake in Chapter 5: pushing without updating metadata.json version. Always bump the version when you edit any file in the skill folder. If you only edited SKILL_HE.md (translation polish), bump the patch (0.0.X). If you added a new tool or chapter, bump the minor. If you changed the skill's scope or removed a feature, bump the major.

For the workflow tool that scaffolds correctly the first time, install `skills-il-skill-creator` (`npx skills-il add developer-tools/skills-il-skill-creator`). The course gives you the concepts; the skill executes the workflow without you having to remember every field.

## Chapter 6: The 10-minute pre-publish checklist

This chapter is short on purpose. It is the checklist you run BEFORE pushing. Ten minutes spent here saves multiple back-and-forth rounds with the review pipeline.

### The 10 most common rejection reasons

1. **Description too vague.** "A skill for Israeli things" routes badly. Use the "Use when X, Y, Z. Do NOT use for A, B" pattern.
2. **No "Do NOT use for" clause.** Without it, the LLM loads your skill in the wrong context and produces a confidently-wrong answer.
3. **Hebrew calques in display_description or SKILL_HE.md.** "שכבת האסטרטגיה", "שתי שאלות עוגן", literal English word order. A native Israeli reader spots this in 5 seconds.
4. **Fabricated thresholds, form numbers, or law citations.** Wrong tax brackets in 2026. Wrong Bituach Leumi form numbers. The reviewer cross-checks against primary sources; fabrications are rejected hard.
5. **Slug does not match folder name.** Sync pipeline picks up the folder name; metadata.name must match exactly.
6. **No worked example in the body.** Without examples, the LLM hallucinates edge cases.
7. **References to files in references/ or scripts/ that do not exist.** Local validator catches this. Run it.
8. **Wrong supported_agents slugs.** `claude` instead of `claude-code`, `gemini` instead of `gemini-cli`. Renders as empty gray icons on the card.
9. **Em dashes anywhere in SKILL.md, SKILL_HE.md, or metadata.json.** Project convention is no em dashes, period. Use commas, parens, colons.
10. **Forgot to bump version in metadata.json after edits.** Sync silently overwrites content but the catalog's version indicator stays stale and the `update-skill` admin flow has nothing to fan out to followers.

### The 10-minute pre-publish checklist (literal)

![Pre-publish 10-minute checklist](pre-publish-checklist.png)

Run these in order. Each is one shell command or a 30-second read.

1. Grep all three files for the em-dash character (U+2014). The output must be empty.
2. `jq -r '.name' metadata.json` and verify it equals `basename "$(pwd)"`.
3. Read your `description` aloud. Does it answer "when should the LLM load this?" in one sentence? Does it have a "Do NOT use for" clause?
4. Read SKILL_HE.md aloud (or have a native Hebrew speaker read it). Does it read like Hebrew, or like translated English?
5. Pick one number, percentage, or NIS amount in your body. Open the primary source for it. Confirm it matches.
6. Pick the chapter with the most decision logic. Find the worked example. Re-derive it on paper to confirm the math.
7. List the files in `references/` and `scripts/`. For each, grep SKILL.md to confirm it is referenced.
8. Open the local catalog (`pnpm dev` in skills-il frontend, navigate to your category) and confirm the supported-agent icons render as real platform logos, not empty circles.
9. Bump `version` in metadata.json (CHANGELOG.md is optional for skills, unlike courses).
10. Run the local validator one last time.

If all 10 pass, push. If any fail, fix locally first.

### The "would the chatbot's default answer be better?" test

The single most important question to ask before publishing: would a user be BETTER off without your skill, getting the LLM's default answer?

Some skills fail this test silently. The skill gets installed; it routes correctly; the LLM dutifully loads the body; and the response is WORSE than what Claude would have said without the skill at all, because the skill author hardcoded outdated information or oversimplified the rule.

This happens when the skill's body is older than the underlying source. A skill that quotes prior-year tax brackets, last-year's average wage, or a fee schedule from before a recent regulator change is worse than no skill at all. The LLM's default answer, lacking the skill, would at least pull from its general knowledge and acknowledge uncertainty; the stale skill confidently delivers a wrong number. Skills must be kept current; the `update-skill` admin flow exists for exactly this reason.

If you cannot commit to keeping your skill current as the underlying domain changes, do not publish it. Pick a stable topic (algorithms, structural rules, evergreen patterns) instead of a time-sensitive one (rates, prices, current product offerings).

### When to ship a skill vs an MCP server

A final framing: if your "skill" is really "tell the LLM how to call this API and parse this response," do not write a skill. Write an MCP server. The skills-il MCP directory accepts community submissions the same way the skill catalog does. MCP servers handle live state better, are easier to keep current, and pair naturally with skills that handle decision-making.

A clean division:

- **Skill**: how to interpret the response from an MCP server. What to do with the data. The decision rules.
- **MCP server**: how to fetch the data. The API contract. The current state.

When both are needed (which is most Israeli use cases), ship the MCP as a separate package and have the skill recommend it via the install command in the body.

### Where to find example skills to learn from

The skills-il catalog has 130+ published skills. Browse the top-installed in each category (`https://agentskills.co.il/skills?sort=installs`) and read a few SKILL.md files. The pattern emerges quickly.

Specific starter exemplars by complexity:

- **Smallest**: `israeli-phone-formatter` (`npx skills-il add developer-tools/israeli-phone-formatter`), a tight focused formatter
- **Small with scripts/**: `israeli-id-validator` (`npx skills-il add developer-tools/israeli-id-validator`), adds a deterministic check-digit algorithm
- **Medium with references/**: `hebrew-seo-geo-toolkit` (`npx skills-il add marketing-growth/hebrew-seo-geo-toolkit`), bilingual + multi-section + real references/ usage

When you have your first PR open and merged, the catalog gets one better. Ship it.
