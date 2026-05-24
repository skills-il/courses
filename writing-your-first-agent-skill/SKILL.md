---
name: writing-your-first-agent-skill
description: A 6-chapter course for developers on how to write an agent skill from scratch. Covers the SKILL.md format, frontmatter anatomy, references/ vs scripts/, sharing your skill, and the 10 most common authoring mistakes. The format is the one Claude Code, Cursor, Windsurf, and Claude Desktop all accept. Works for personal skills, team skills, or contributions to public catalogs.
license: MIT
---

# Writing Your First Agent Skill

Most developers who write a skill for the first time end up with one of two outcomes: a tiny, focused, useful skill that they actually use, or a sprawling 2000-word SKILL.md that the LLM never loads because the description is too vague. The difference is not effort. It is understanding what the skill actually IS to the LLM at routing time, and what the spec lets you say.

This course is for developers who can write code but have not yet authored a skill, or have written one and want to understand WHY some skills get picked up reliably by the agent and others sit unused. Six chapters. Concrete examples. The skill you produce can be a personal skill you keep locally, a skill you share with your team, or a contribution to a public catalog. The mechanics are the same in all three cases.

## Course Overview

| Chapter | What you walk away with |
|---|---|
| 1. What is a skill, really? | The mental model: skill vs MCP vs system prompt vs CLI, and when each fits |
| 2. Anatomy of a great SKILL.md | The 3 frontmatter fields, the description as routing input, and the "Use when / Do NOT use for" pattern |
| 3. Extending the format (optional) | When you need more than the spec offers: catalog metadata and the sidecar pattern |
| 4. references/ vs scripts/ | When to use each, with worked examples |
| 5. Sharing your skill | Four scenarios: personal, team, internal catalog, public catalog |
| 6. The 10-minute pre-share checklist | The 10 most common authoring mistakes and how to avoid them |

This course assumes you have basic familiarity with git, Markdown, and JSON. No prior experience with the skill format required.

## Chapter 1: What is a skill, really?

A skill is the simplest way to teach an AI assistant to handle a specific task: a single Markdown file with YAML frontmatter at the top, optionally accompanied by reference files and executable scripts. The agent reads the file on demand when the description matches the user's request. That is the entire model. Everything else (how you distribute it, how it gets installed, what UI a catalog wraps around it) is built around that one file.

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

### The skill format, in one paragraph

Every skill is a folder containing at minimum a `SKILL.md` file with YAML frontmatter. The frontmatter requires two fields per the Anthropic spec, `name` (kebab-case slug) and `description` (one or two sentences the LLM reads to decide whether to load the skill). `license` is conventional in the upstream spec and is expected by most ecosystem tooling. The body is plain Markdown, loaded into the LLM's context once the skill is invoked. Optionally the folder can contain a `references/` subfolder (static files the LLM reads when needed) and a `scripts/` subfolder (executable code the agent's shell tool can run). That is the entire spec.

### When NOT to write a skill (the decision tree)

Before you write a single line of SKILL.md, run this check:

- **Does the LLM already do this well without a skill?** If you ask Claude "format this Israeli phone number" and it does it correctly on the first try, you do not need a phone-formatter skill. Skills are for cases where the default behavior is wrong, incomplete, or culturally tone-deaf.
- **Does the task require live data?** If the answer changes hourly (stock prices, government API responses, traffic), the skill is the wrong abstraction. Write an MCP server.
- **Is the task purely computational with a single right answer?** A simple checksum or format converter might be better as a one-line scripts/ entry called from inside a larger skill, not as its own skill.
- **Are you sure the audience needs it?** Talk to 3 prospective users before writing. Skills nobody uses get quietly abandoned by their authors; pre-validating saves you the disappointment.

The most common mistake in Chapter 1: writing a skill where an MCP would fit better. Symptom: your skill's body is mostly "call this URL, parse this JSON, return this field." Fix: convert to an MCP server with a single tool, and your "skill" becomes a one-line MCP invocation.

If your topic survives the decision tree, move on to Chapter 2 to learn what to put in SKILL.md.

## Chapter 2: Anatomy of a great SKILL.md

A great SKILL.md does three things at once: it tells the LLM when to load itself (the description), it teaches the LLM how to perform the task (the body), and it gives the LLM enough examples to handle edge cases without escalating to the user. If any of these three are missing, the skill either does not get loaded (description failure), does the wrong thing (body failure), or asks the user too many clarifying questions (examples failure).

### The frontmatter fields

![SKILL.md anatomy with callouts](skill-md-anatomy.png)

```yaml
---
name: id-validator
description: Validate national ID numbers (such as the Israeli תעודת זהות) using a Luhn-style check-digit algorithm. Use when a user pastes a 9-digit ID and asks "is this valid", or when generating sample IDs for testing. Do NOT use for credit card numbers, EAN barcodes, or international passport numbers.
license: MIT
---
```

- **`name`** must be kebab-case, must match the folder name exactly, and is the slug the LLM uses to identify the skill internally. Pick something specific: `id-validator`, not `id-tools`. Required by the spec.
- **`description`** is the single most important field in your skill. In hosts that use description-based routing (Claude Code's skill discovery is the canonical case), the LLM reads primarily this field to decide whether to load the skill into context. In other hosts the user explicitly picks the skill from a list, but the description is still what the LLM sees first. Treat it as both marketing copy and a routing specification. Required by the spec.
- **`license`** is typically `MIT`. The Anthropic upstream spec treats license as conventional rather than strictly required, but most ecosystem tooling expects it. Include it.

### The description is the routing input

In hosts that auto-discover skills by description (Claude Code is the canonical case), the LLM scans the descriptions of available skills to decide which (if any) to load. It does NOT read the body. It does NOT read the `references/`. It reads only the description. In hosts where the user explicitly picks a skill from a list (Claude Desktop, some Cursor flows), the description is still the user-facing summary that determines whether they click. Either way, the description has to:

1. Name the task clearly (in both languages of the term, if there's a non-English name)
2. Trigger on the natural-language patterns a user would actually use
3. Exclude cases that look similar but require a different skill

The "Use when..." and "Do NOT use for..." patterns make this concrete:

> "Validate national ID numbers (such as the Israeli תעודת זהות) using a Luhn-style check-digit algorithm. Use when a user pastes a 9-digit ID and asks 'is this valid', or when generating sample IDs for testing. Do NOT use for credit card numbers, EAN barcodes, or international passport numbers."

The "Do NOT" clause is critical. Without it, the LLM might load this skill when the user asks about a credit-card check digit, then try to apply the Luhn variant tuned for 9-digit national IDs and fail confusingly. With the "Do NOT" clause, the LLM correctly routes elsewhere.

### Body structure: scope, rules, examples, anti-patterns

The body is what the LLM reads after deciding to load the skill. It needs four sections, in roughly this order:

1. **Scope** (one paragraph): what exactly this skill covers, restated more precisely than the description allowed.
2. **Decision rules** (the meat): the if-then logic the LLM should apply. Use bulleted lists, decision trees, or worked examples. Avoid prose.
3. **Worked examples** (mandatory): show the input, the reasoning, and the output. Cover the typical case and at least one edge case. Without worked examples, the LLM hallucinates the boundary behavior.
4. **Anti-patterns** (recommended): tell the LLM what NOT to do, even if it sounds tempting. Anti-patterns prevent failure modes that would otherwise look correct.

### Study example: read a small focused skill

The fastest way to internalize this is to read one. Find a small skill (~150 lines) with a clear scope, a deterministic algorithm in `scripts/`, and concrete worked examples. Public catalogs typically let you browse by install count, which surfaces well-designed reference skills quickly. Reading one end to end is faster than any further description here can be.

The most common mistake in Chapter 2: writing a description that is too vague. "A skill for Israeli things" gets loaded for every Israeli-context conversation and does nothing useful for any of them. Pick ONE task. Name it specifically. Add the "Use when..." and "Do NOT use for..." patterns.

## Chapter 3: Extending the format (optional)

The skill format (the spec developed by Anthropic, accepted by Claude Code, Cursor, Windsurf, and Claude Desktop) is intentionally minimal: `SKILL.md` with three frontmatter fields, plus the optional `references/` and `scripts/` subfolders. That is enough for a personal skill, or a skill you share by zipping a folder and sending it to a colleague. But if you want to put your skill in a catalog or expose extra metadata to consumers, you need to extend the spec somehow.

This chapter shows ONE common extension pattern: a `metadata.json` sidecar alongside `SKILL.md`. The specific keys below are conventions used by one public catalog (agentskills.co.il) and are useful as a worked example; other catalogs pick different keys, and some skip the sidecar entirely in favor of a `locale` field or language-coded subfolders. The SIDECAR pattern is the lesson, not the specific schema. If your skill is purely personal, you can skip this chapter entirely.

### Why a sidecar JSON instead of nested YAML

Claude Desktop's strict YAML parser rejects nested keys inside SKILL.md frontmatter outright, refusing to load the skill at all. So the established pattern is to keep SKILL.md frontmatter minimal (`name`, `description`, `license`, and nothing else) and pull catalog-specific data into a separate `metadata.json` file alongside SKILL.md. Hosts that read only SKILL.md frontmatter (like Claude Desktop) load cleanly. Catalog tooling that reads `metadata.json` gets the cataloging data it needs.

### Example metadata.json fields

![metadata.json structure with key fields](metadata-json-structure.png)

```json
{
  "name": "id-validator",
  "version": "1.2.0",
  "license": "MIT",
  "display_name": "ID Validator",
  "display_description": "Validate national ID numbers using a check-digit algorithm. Useful for forms, test data, and catching bad IDs before submission.",
  "audience": "developers",
  "level": "beginner",
  "tags": ["id", "validation", "checksum"],
  "supported_agents": ["claude-code", "cursor", "windsurf", "claude-desktop"]
}
```

- **`display_name`** is the catalog title.
- **`display_description`** is the catalog marketing copy.
- **`audience`** is typically one of: `developers`, `non-technical`, `professionals`, `mixed`. Drives the catalog filter and the default writing register.
- **`level`** is typically one of: `beginner`, `intermediate`, `advanced`.
- **`tags`** is a string array. Catalogs filter on these.
- **`supported_agents`** uses canonical slugs: `claude-code` (not `claude`), `gemini-cli` (not `gemini`), `cursor`, `windsurf`, `claude-desktop`. Wrong slugs render as empty icons on cards in most catalog UIs.

A note on multilingual catalogs: some accept `{ he, en }` objects for `display_name`, `display_description`, and `tags` instead of flat strings, so the catalog can show different copy per locale. That is a per-catalog convention, not the default shape; check your target catalog's schema before assuming either form.

The most common mistake in Chapter 3: guessing your target catalog's sidecar schema instead of reading its contribution guide. Different catalogs use different keys for the same concepts (`audience` vs `target_users`, `tags` vs `keywords`, flat strings vs `{he, en}` objects). Get the exact schema from the catalog before authoring; otherwise you will rework the sidecar at submission time.

## Chapter 4: references/ vs scripts/ (when to use which)

A skill folder can include two optional subfolders: `references/` and `scripts/`. They serve different purposes and choosing the wrong one is a frequent rejection reason. The rule is simple: `references/` for static content the LLM reads, `scripts/` for executable code the LLM runs. The hard part is recognizing which side of the line your content falls on.

### references/: static files the LLM reads on demand

`references/` holds files the LLM can READ when it needs them: markdown explanations, JSON lookup tables, sample data, template files, image specifications. The LLM reads these via a file-read tool; it does not execute them.

Typical uses:

- **Lookup tables**: an array of Israeli area codes mapped to cities, stored as JSON, referenced when the LLM needs to identify a phone number's origin
- **Long-form reference content**: a 2000-word explanation of a multi-step process, kept out of SKILL.md (which should stay short and routing-focused) and pulled in only when the LLM hits a specific question
- **Templates**: sample contracts, sample forms, boilerplate the LLM customizes for the user
- **Image specs**: prompts for generating illustrations, kept separate from the body

A good `references/` entry is something the LLM needs only sometimes, where loading it into context up-front would waste tokens.

### scripts/: executable code the LLM CAN run

`scripts/` holds code the agent can EXECUTE: validators, parsers, deterministic computations, network calls. The agent invokes scripts via the host's shell tool (Bash in Claude Code, the equivalent in other hosts), reads stdout/stderr, and incorporates the parsed output into its response. There is no built-in "function-call" mechanism for scripts in the Skills spec; scripts are plain executables the agent runs and reads.

Typical uses:

- **Deterministic computation the LLM should not redo**: a Luhn check-digit algorithm for Israeli IDs (the LLM would re-derive it inconsistently otherwise)
- **Parsers**: a function that takes a raw payslip text and returns a structured JSON breakdown
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
- Putting binary files (PNG, ZIP) in `references/` unless they are sample data the LLM specifically inspects.

### Study examples

For a textbook scripts/ example, find a skill that ships a small implementation of a deterministic algorithm (a Luhn check-digit validator for Israeli IDs is a classic). The body of SKILL.md describes when to use the algorithm; the actual math lives in the script. That is the canonical "deterministic compute belongs in scripts/" pattern.

For a contrasting references/ example, look for a skill that stores a lookup table (mobile/landline/special-service phone prefixes is a common one) as JSON in `references/`, instead of inlining the table into the body.

The most common mistake in Chapter 4: pasting a long lookup table into the SKILL.md body instead of `references/`. Symptom: the body is 80 percent table and 20 percent actual decision rules. Fix: move the table to a JSON file in `references/` and reference it from the body. Token efficiency improves, and the body becomes readable as decision logic again.

## Chapter 5: Sharing your skill

You have written SKILL.md, optionally added references/ and scripts/, and the skill works. Now the practical question: how do you actually use it, share it with others, or publish it to a catalog? This chapter covers four scenarios in order of effort.

![Publication flow: scaffold to trust score](publication-flow.png)

### Scenario A: Personal skill, local only

The simplest use: keep the skill on your own machine. Most hosts that support the skill format let you install a skill from a local folder. For example, in Claude Code:

```bash
claude skill install /path/to/your-skill-folder
```

That is it. The skill is now available in your Claude Code sessions. No publication, no review, no catalog. Personal skills are perfectly valid and often the best fit for skills that are specific to YOUR workflow.

### Scenario B: Share with a team or a friend

You want a colleague to use your skill. Two common patterns:

1. **Zip the folder, send it.** They unzip, install locally with `claude skill install /path/to/your-skill-folder`. Works for any audience, no infrastructure needed.
2. **Push to a private git repo.** They clone, install from the local clone. Easier to keep in sync as you iterate; works well for a team.

Both approaches assume the recipient knows how to install a local skill on their host. For non-developer audiences, a public catalog (Scenario D) is often easier.

### Scenario C: Internal company catalog

If your team or company has a shared internal catalog (an internal directory of skills your engineers can install from), follow your organization's contribution process. Common patterns: PRs to an internal git monorepo, a private npm registry, or a custom internal install script. The skill content is unchanged; only the distribution mechanism differs.

### Scenario D: Publish to a public catalog

If your skill is useful to people beyond your team, consider a public catalog. The two main options as of 2026:

- **The Anthropic skill registry** (when generally available), the canonical place for general-purpose skills.
- **Topic-specific community catalogs.** The Israeli-context catalog at agentskills.co.il accepts community submissions for skills relevant to Israeli users (Hebrew, Israeli APIs, Israeli law). Other community catalogs exist for other niches.

The contribution process varies per catalog. Most public catalogs ask for: the SKILL.md folder, a description of what your skill does, and some form of review (automated lint + human signoff). Catalogs that ship bilingual content ask for a per-language companion file and a `metadata.json` sidecar with catalog-specific display data. Read the catalog's contribution guide before submitting.

### Validation checklist before sharing

Whichever scenario you pick, a quick local sanity-check saves embarrassment:

- YAML frontmatter has `name`, `description`, and `license`; no extra nested keys
- The `name` field equals the folder basename
- Any files you reference from SKILL.md in `references/` or `scripts/` actually exist in the folder
- The description has a clear "Use when..." pattern AND a "Do NOT use for..." clause
- If you have multiple language versions or a `metadata.json` sidecar, they are internally consistent (slugs match, no missing translations)
- Run the skill yourself on a fresh Claude Code session and verify it loads and behaves as expected

### Versioning + change tracking

When you update your skill, bump a version somewhere (either a `version` field in your frontmatter, or in `metadata.json` if you have one, or a git tag). Semver works well: patch (0.0.X) for fixes, minor (0.X.0) for additions, major (X.0.0) for breaking changes or scope shifts.

For public catalogs, the catalog will usually handle changelog distribution to your skill's followers. For personal or team skills, keeping a simple `CHANGELOG.md` next to your SKILL.md is enough.

The most common mistake in Chapter 5: shipping a skill update without bumping the version. Consumers of your skill (or your future self) cannot tell what changed. Always bump the version; always note what changed in one sentence somewhere.

## Chapter 6: The 10-minute pre-share checklist

This chapter is short on purpose. It is the checklist you run BEFORE sharing your skill with anyone (a colleague, a public catalog, or your future self after a long break). Ten minutes spent here saves multiple back-and-forth rounds with reviewers and prevents the most common authoring mistakes.

### The 10 most common authoring mistakes

1. **Description too vague.** "A skill for Israeli things" routes badly. Use the "Use when X, Y, Z. Do NOT use for A, B" pattern.
2. **No "Do NOT use for" clause.** Without it, the LLM loads your skill in the wrong context and produces a confidently-wrong answer.
3. **Description in YAML block-scalar form (`>-` or `|`).** Some YAML parsers (Claude Desktop's, among others) accept it; others fold whitespace differently or reject it outright. Keep the description on a single line.
4. **Fabricated thresholds, form numbers, or law citations.** Wrong tax brackets, wrong agency form numbers, made-up regulation citations. Reviewers cross-check against primary sources; fabrications are rejected hard.
5. **Slug does not match folder name.** Most validators and catalogs require the slug in your frontmatter (or `metadata.json`) to equal the folder basename exactly. Otherwise the entry fails to register.
6. **No worked example in the body.** Without examples, the LLM hallucinates edge cases.
7. **References to files in `references/` or `scripts/` that do not exist.** A local validator catches this in seconds. Run it.
8. **Wrong `supported_agents` slugs.** `claude` instead of `claude-code`, `gemini` instead of `gemini-cli`. Renders as empty gray icons on the catalog card.
9. **Em dashes anywhere in SKILL.md, the translated body, or `metadata.json`.** Project convention is no em dashes, period. Use commas, parens, colons.
10. **Forgot to bump the version after edits.** Distribution channels silently overwrite content, but the version indicator stays stale and consumers (or your future self) cannot tell what changed.

### The 10-minute pre-publish checklist (literal)

![Pre-publish 10-minute checklist](pre-publish-checklist.png)

Run these in order. Each is one shell command or a 30-second read.

1. Grep all three files for the em-dash character (U+2014). The output must be empty.
2. `jq -r '.name' metadata.json` and verify it equals `basename "$(pwd)"`.
3. Read your `description` aloud. Does it answer "when should the LLM load this?" in one sentence? Does it have a "Do NOT use for" clause?
4. Open a fresh Claude Code session. Paste a prompt your skill SHOULD handle, then one it should NOT handle. Verify the LLM routes correctly in both cases (loads your skill for the first, doesn't for the second).
5. Pick one number, percentage, or currency amount in your body. Open the primary source for it. Confirm it matches.
6. Pick the chapter with the most decision logic. Find the worked example. Re-derive it on paper to confirm the math.
7. List the files in `references/` and `scripts/`. For each, grep SKILL.md to confirm it is referenced.
8. If you are publishing to a catalog with rendered preview UI, open that catalog's dev or staging environment and confirm everything looks right, including any supported-agent icons or platform logos.
9. Bump the version (in your frontmatter, in `metadata.json`, or in a git tag, wherever you track it).
10. If your distribution channel runs a validator script, run it locally one last time before pushing.

If all 10 pass, share. If any fail, fix locally first.

### The "would the chatbot's default answer be better?" test

The single most important question to ask before sharing: would a user be BETTER off without your skill, getting the LLM's default answer?

Some skills fail this test silently. The skill gets installed; it routes correctly; the LLM dutifully loads the body; and the response is WORSE than what Claude would have said without the skill at all, because the skill author hardcoded outdated information or oversimplified the rule.

This happens when the skill's body is older than the underlying source. A skill that quotes prior-year tax brackets, last-year's average wage, or a fee schedule from before a recent regulator change is worse than no skill at all. The LLM's default answer, lacking the skill, would at least pull from its general knowledge and acknowledge uncertainty; the stale skill confidently delivers a wrong number. Skills must be kept current.

If you cannot commit to keeping your skill current as the underlying domain changes, do not share it widely. Pick a stable topic (algorithms, structural rules, evergreen patterns) instead of a time-sensitive one (rates, prices, current product offerings). Or keep the skill personal and update it whenever you notice the world has moved on.

### When to ship a skill vs an MCP server

A final framing: if your "skill" is really "tell the LLM how to call this API and parse this response," do not write a skill. Write an MCP server. MCP servers handle live state better, are easier to keep current, and pair naturally with skills that handle decision-making.

A clean division:

- **Skill**: how to interpret the response from an MCP server. What to do with the data. The decision rules.
- **MCP server**: how to fetch the data. The API contract. The current state.

When both are needed, ship the MCP separately and have the skill recommend installing it.

### Where to find example skills to learn from

The fastest way to internalize good SKILL.md patterns is to read a handful of skills that other developers have published. Some public catalogs let you browse by install count, which is a rough proxy for "this skill is well-designed enough that people actually use it." For Israeli-context skills, agentskills.co.il is one such catalog; for other niches, find the community catalog that fits.

Three useful starter exemplars by complexity:

- **Smallest**: a tight, focused formatter (e.g., a phone-number formatter for your country)
- **Small with `scripts/`**: a skill that adds a deterministic check-digit or parsing algorithm
- **Medium with `references/`**: a bilingual or multi-section skill with real `references/` usage

Read three skills from start to finish before you write yours. The pattern emerges quickly. Then write yours and ship it: install it locally, share it with one person, see what they say, iterate.
