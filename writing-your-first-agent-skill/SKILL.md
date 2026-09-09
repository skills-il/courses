---
name: writing-your-first-agent-skill
description: A 6-chapter course for developers on how to write an agent skill from scratch. Covers the SKILL.md format, frontmatter anatomy, references/ vs scripts/, sharing your skill, and the 10 most common authoring mistakes. The format is an open specification supported by Claude Code, the Claude apps, and other editors. Works for personal skills, team skills, or contributions to public catalogs.
license: MIT
---

# Writing Your First Agent Skill

Most developers who write a skill for the first time end up with one of two outcomes: a tiny, focused, useful skill that they actually use, or a sprawling 2000-word SKILL.md that the LLM never loads because the description is too vague. The difference is not effort. It is understanding what the skill actually IS to the LLM at routing time, and what the spec lets you say.

This course is for developers who can write code but have not yet authored a skill, or have written one and want to understand WHY some skills get picked up reliably by the agent and others sit unused. Six chapters. Concrete examples. The skill you produce can be a personal skill you keep locally, a skill you share with your team, or a contribution to a public catalog. The mechanics are the same in all three cases.

## Course Overview

| Chapter | What you walk away with |
|---|---|
| 1. What is a skill, really? | The mental model: skill vs MCP vs system prompt vs CLI, and when each fits |
| 2. Anatomy of a great SKILL.md | The frontmatter fields and their limits, the description as routing input, and the "Use when / Do NOT use for" pattern |
| 3. Extending the format (optional) | When you need more than the spec offers: catalog metadata and the sidecar pattern |
| 4. references/ vs scripts/ | When to use each, with worked examples |
| 5. Sharing your skill | Four scenarios: personal, team, internal catalog, public catalog |
| 6. The 10-minute pre-share checklist | The 10 most common authoring mistakes and how to avoid them |

This course assumes you have basic familiarity with git, Markdown, and JSON. No prior experience with the skill format required.

## Chapter 1: What is a skill, really?

A skill is the simplest way to teach an AI assistant to handle a specific task: a single Markdown file with YAML frontmatter at the top, optionally accompanied by reference files and executable scripts. The agent reads the file on demand when the description matches the user's request. That is the entire model. Everything else (how you distribute it, how it gets installed, what UI a catalog wraps around it) is built around that one file.

### The four-way comparison: skill vs MCP vs system prompt vs CLI

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

Every skill is a folder containing at minimum a `SKILL.md` file with YAML frontmatter. The frontmatter requires exactly two fields, `name` (kebab-case slug) and `description` (one or two sentences the agent reads to decide whether to load the skill). Four more are optional: `license`, `compatibility`, `metadata` and `allowed-tools`. The body is plain Markdown, loaded into the LLM's context once the skill is invoked. Optionally the folder can contain a `references/` subfolder (static files the LLM reads when needed) and a `scripts/` subfolder (executable code the agent's shell tool can run). That is the entire spec.

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

```yaml
---
name: id-validator
description: Validate national ID numbers (such as the Israeli תעודת זהות) using a Luhn-style check-digit algorithm. Use when a user pastes a 9-digit ID and asks "is this valid", or when generating sample IDs for testing. Do NOT use for credit card numbers, EAN barcodes, or international passport numbers.
license: MIT
---
```

- **`name`** must be 1 to 64 characters, lowercase letters, digits and hyphens only, must not start or end with a hyphen or contain two hyphens in a row, and must match the parent directory name exactly. Pick something specific: `id-validator`, not `id-tools`. Required by the spec.
- **`description`** is the single most important field in your skill. In hosts that use description-based routing (Claude Code's skill discovery is the canonical case), the LLM reads primarily this field to decide whether to load the skill into context. In other hosts the user explicitly picks the skill from a list, but the description is still what the LLM sees first. Treat it as both marketing copy and a routing specification. Required by the spec.
- **`license`** is optional in the spec, typically `MIT`. The spec recommends keeping it short: a licence name, or the name of a bundled licence file.

The other three optional fields are worth knowing about even if you never use them:

- **`compatibility`** (max 500 characters) states environment requirements, and the spec is explicit that most skills do not need it. Use it when your skill genuinely will not work without something: `compatibility: Requires git, docker, jq, and access to the internet`.
- **`metadata`** is a map from string keys to string values for properties the spec itself does not define, such as `author` and `version`. Keep your key names distinctive to avoid collisions with other tooling.
- **`allowed-tools`** is a space-separated string of pre-approved tools, for example `allowed-tools: Bash(git:*) Bash(jq:*) Read`. It is marked experimental and support varies between agents, so do not depend on it.

### The limits nobody tells you about until your skill is rejected

The spec sets hard bounds, and they are the most common reason a skill fails validation on first submission:

| Field | Limit |
|---|---|
| `name` | 1 to 64 characters |
| `description` | 1 to 1024 characters, non-empty |
| `compatibility` | 1 to 500 characters, if present |
| `SKILL.md` body | keep under 500 lines |
| Instructions loaded on activation | under 5000 tokens recommended |

Two practical notes on the description cap. First, write it in the third person. The description is injected into the system prompt, and mixing points of view ("I help you validate..." next to "Validates...") causes discovery problems. Second, do not write to the limit. Some publishing targets enforce a stricter cap than the spec's, and some count the characters differently than you will, YAML quoting included, so a description that measures 1024 on your machine can be rejected as too long by the thing you are submitting to. Leave real headroom, around 950, and check your target's own cap before you submit. One practical trick when you need to claw back a few characters: an inline colon forces YAML to quote the whole value, so rewording a colon into a comma is often the cheapest cut available.

### The description is the routing input

In hosts that auto-discover skills by description (Claude Code is the canonical case), the LLM scans the descriptions of available skills to decide which (if any) to load. It does NOT read the body. It does NOT read the `references/`. It reads only the description. In hosts where the user explicitly picks a skill from a list (the Claude apps, some editor flows), the description is still the user-facing summary that determines whether they click. Either way, the description has to:

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

### Body length costs tokens

Everything in the body loads into context every time the skill routes. A 4000-word body costs roughly 5K-6K tokens per triggering turn in English (Hebrew is heavier). For a skill that triggers often, this becomes real money over a month.

The optimization rule: keep the body short and decision-focused. Push long lookup tables, templates, and detailed prose to `references/`, which the LLM reads on demand only when its reasoning calls for it. Chapter 4 expands on this split.

### Study example: read a small focused skill

The fastest way to internalize this is to read one. Find a small skill (~150 lines) with a clear scope, a deterministic algorithm in `scripts/`, and concrete worked examples. Public catalogs typically let you browse by install count, which surfaces well-designed reference skills quickly. Reading one end to end is faster than any further description here can be.

The most common mistake in Chapter 2: writing a description that is too vague. "A skill for Israeli things" gets loaded for every Israeli-context conversation and does nothing useful for any of them. Pick ONE task. Name it specifically. Add the "Use when..." and "Do NOT use for..." patterns.

## Chapter 3: Extending the format (optional)

The skill format is intentionally minimal: `SKILL.md` with two required frontmatter fields and four optional ones, plus the optional `references/`, `scripts/` and `assets/` subfolders. It is an open specification, supported by Claude Code, the Claude apps and the Claude API, and accepted by a growing number of third-party editors and agents. That is enough for a personal skill, or a skill you share by zipping a folder and sending it to a colleague. But if you want to put your skill in a catalog or expose extra metadata to consumers, you need to extend the spec somehow.

This chapter shows ONE common extension pattern: a `metadata.json` sidecar alongside `SKILL.md`. The specific keys below are conventions used by one public catalog (agentskills.co.il) and are useful as a worked example; other catalogs pick different keys, and some skip the sidecar entirely in favor of a `locale` field or language-coded subfolders. The SIDECAR pattern is the lesson, not the specific schema. If your skill is purely personal, you can skip this chapter entirely.

### Why a sidecar JSON instead of nested YAML

The spec does give you a `metadata` field for this, and for a handful of simple properties like `author` and `version` that is the right place. But it is deliberately a map from string keys to STRING values, so the moment your catalog needs a bilingual display name, an array of tags, or a list of supported agents, it does not fit. Some hosts have also historically been strict about nested YAML in frontmatter and refused to load a skill outright.

So the established catalog pattern is to keep SKILL.md frontmatter to what the spec defines and pull catalog-specific data into a separate `metadata.json` alongside it. Hosts that read only SKILL.md frontmatter load cleanly and never see the catalog data, which is what you want: none of it helps the agent do the task, so none of it should cost you context. Catalog tooling reads `metadata.json` and gets what it needs.

### Example metadata.json fields

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
  "supported_agents": ["claude-code", "cursor", "windsurf", "claude-desktop"],
  "recommended_skills": ["currency-formatter", "date-validator"]
}
```

- **`display_name`** is the catalog title.
- **`display_description`** is the catalog marketing copy.
- **`audience`** is typically one of: `developers`, `non-technical`, `professionals`, `mixed`. Drives the catalog filter and the default writing register.
- **`level`** is typically one of: `beginner`, `intermediate`, `advanced`.
- **`tags`** is a string array. Catalogs filter on these.
- **`supported_agents`** uses canonical slugs: `claude-code` (not `claude`), `gemini-cli` (not `gemini`), `cursor`, `windsurf`, `claude-desktop`. Wrong slugs render as empty icons on cards in most catalog UIs.
- **`recommended_skills`** is an array of slugs catalogs typically render as "related skills" on the detail page. Pick skills users genuinely need alongside yours, not promotional cross-links. An ID validator recommending a phone-number formatter is honest. An ID validator recommending an unrelated marketing skill is spam.

A note on multilingual catalogs: some accept `{ he, en }` objects for `display_name`, `display_description`, and `tags` instead of flat strings, so the catalog can show different copy per locale. That is a per-catalog convention, not the default shape; check your target catalog's schema before assuming either form.

The most common mistake in Chapter 3: guessing your target catalog's sidecar schema instead of reading its contribution guide. Different catalogs use different keys for the same concepts (`audience` vs `target_users`, `tags` vs `keywords`, flat strings vs `{he, en}` objects). Get the exact schema from the catalog before authoring; otherwise you will rework the sidecar at submission time.

## Chapter 4: references/ vs scripts/ (when to use which)

The spec names three optional subfolders: `references/` for documentation the agent reads, `scripts/` for executable code it runs, and `assets/` for static resources such as templates, images, schemas and lookup tables. Choosing the wrong one is a frequent rejection reason. The rule is simple: does the agent READ it, RUN it, or USE it as raw material? The hard part is recognising which side of the line your content falls on. Nothing stops you putting other files and folders in a skill, but these three are the conventions readers and tooling expect.

### references/: static files the LLM reads on demand

`references/` holds files the LLM can READ when it needs them: markdown explanations, JSON lookup tables, sample data, template files, image specifications. The LLM reads these via a file-read tool; it does not execute them.

Typical uses:

- **Prose the agent reads**: a written explanation of a multi-step process, a glossary, a decision guide. (A lookup TABLE is data rather than documentation, so it belongs in `assets/`.)
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

When you have content that supports your skill, ask:

1. **Is it deterministic computation the LLM might re-derive wrong?** → `scripts/`
2. **Does it require an API key, network call, or filesystem write?** → `scripts/`
3. **Is it a static lookup, template, or long-form explanation the LLM needs only sometimes?** → `references/`
4. **Is it a brief, always-relevant rule or example?** → Inline in `SKILL.md` body
5. **Is it a long, always-relevant rule the LLM must always know?** → Probably should not be in a skill; consider a system prompt or a different skill that covers it

### File size and structure

The budgets that matter are the ones the spec actually states. Keep `SKILL.md` itself under 500 lines, and keep what loads on activation under about 5000 tokens. Reference files are loaded on demand, so smaller files mean less context burned, and the spec asks you to keep file references one level deep from `SKILL.md` rather than building chains of documents that point at each other. `scripts/` files should be self-contained or clearly document their dependencies, give helpful error messages, and handle edge cases; a script that has grown past the point where one person can read it in a sitting should probably become a real package that the skill calls.

Avoid:

- Pasting a 50-row lookup table into the SKILL.md body. A lookup table is data, so under the current conventions it belongs in `assets/<table-name>.json`, referenced from the body ("see assets/area-codes.json").
- Writing a Python script inside SKILL.md's body as a code fence. Move it to `scripts/<name>.py` and reference it.
- Putting binary files (PNG, ZIP) in `references/` unless they are sample data the LLM specifically inspects.

### Study examples

For a textbook scripts/ example, find a skill that ships a small implementation of a deterministic algorithm (a Luhn check-digit validator for Israeli IDs is a classic). The body of SKILL.md describes when to use the algorithm; the actual math lives in the script. That is the canonical "deterministic compute belongs in scripts/" pattern.

For a contrasting references/ example, look for a skill that stores a lookup table (mobile/landline/special-service phone prefixes is a common one) as JSON in `references/`, instead of inlining the table into the body.

The most common mistake in Chapter 4: pasting a long lookup table into the SKILL.md body instead of `assets/`. Symptom: the body is 80 percent table and 20 percent actual decision rules. Fix: move the table to a JSON file in `assets/` and reference it from the body. Token efficiency improves, and the body becomes readable as decision logic again.

## Chapter 5: Sharing your skill

You have written SKILL.md, optionally added references/ and scripts/, and the skill works. Now the practical question: how do you actually use it, share it with others, or publish it to a catalog? This chapter covers four scenarios in order of effort.

### Scenario A: Personal skill, local only

The simplest use: keep the skill on your own machine. In Claude Code there is no install step at all. Put the folder in your skills directory and it loads itself:

```bash
cp -r my-skill ~/.claude/skills/my-skill
```

It is picked up on your next session. If you would rather start from a scaffold than an empty folder, `claude plugin init my-skill` creates one in the same place for you.

That is it. No publication, no review, no catalog. Personal skills are perfectly valid and often the best fit for skills that are specific to YOUR workflow. Note that this is a change from earlier guidance: there is no `claude skill install` command, and if you find one in a tutorial, that tutorial predates the current CLI.

### Scenario B: Share with a team or a friend

You want a colleague to use your skill. Two common patterns:

1. **Zip the folder, send it.** Create a ZIP of the skill directory (`zip -r my-skill.zip my-skill/`), send it via Slack, email or Drive. The recipient extracts it into their own skills directory. Tell them to check that `SKILL.md` sits at the root of what they extracted and not one level down, because some unzip tools wrap the contents in an extra folder named after the archive, and a skill whose `name` no longer matches its parent directory will not load.
2. **Push to a git repo and make it a marketplace.** This is the better answer for anything you will iterate on. A repo can be registered as a marketplace, after which your colleague adds it once and installs from it by name:

   ```bash
   claude plugin marketplace add your-org/your-skills-repo
   claude plugin install my-skill@your-skills-repo
   ```

   From then on `claude plugin marketplace update` pulls your changes, which is the part the copy-a-folder approach cannot do.

Both approaches assume the recipient is comfortable on the command line. For non-developer audiences, a public catalog (Scenario D) is often easier.

### Scenario C: Internal company catalog

If your team or company has a shared internal catalog (an internal directory of skills your engineers can install from), follow your organization's contribution process. Common patterns: PRs to an internal git monorepo, a private npm registry, or a custom internal install script. The skill content is unchanged; only the distribution mechanism differs.

### Scenario D: Publish to a public catalog

If your skill is useful to people beyond your team, consider a public catalog. The two main options as of 2026:

- **Plugin marketplaces**, which is how Claude Code distributes skills. Anthropic runs an official one, and any git repo can become one, so this is the closest thing to a canonical route for a general-purpose skill. There is also an open-source `anthropics/skills` repository, and the Claude apps accept a zip upload from settings for individual use.
- **Topic-specific community catalogs.** The Israeli-context catalog at agentskills.co.il accepts community submissions for skills relevant to Israeli users (Hebrew, Israeli APIs, Israeli law). Other community catalogs exist for other niches.

The contribution process varies per catalog. Most public catalogs ask for: the SKILL.md folder, a description of what your skill does, and some form of review (automated lint + human signoff). Catalogs that ship bilingual content ask for a per-language companion file and a `metadata.json` sidecar with catalog-specific display data. Read the catalog's contribution guide before submitting.

### Validation checklist before sharing

Whichever scenario you pick, a quick local sanity-check saves embarrassment:

- YAML frontmatter has `name` and `description`, plus any of the optional spec fields you actually need; no keys the spec does not define
- The `name` field equals the folder basename
- Any files you reference from SKILL.md in `references/` or `scripts/` actually exist in the folder
- The description has a clear "Use when..." pattern AND a "Do NOT use for..." clause
- If you have multiple language versions or a `metadata.json` sidecar, they are internally consistent (slugs match, no missing translations)
- Run the skill yourself on a fresh Claude Code session and verify it loads and behaves as expected

### Versioning + change tracking

When you update your skill, bump a version somewhere (either a `version` field in your frontmatter, or in `metadata.json` if you have one, or a git tag). Semver works well: patch (0.0.X) for fixes, minor (0.X.0) for additions, major (X.0.0) for breaking changes or scope shifts.

For public catalogs, the catalog will usually handle changelog distribution to your skill's followers. For personal or team skills, keeping a simple `CHANGELOG.md` next to your SKILL.md is enough.

### How updates reach existing installers

The spec doesn't define an auto-update mechanism, so update delivery is per-host. A folder copied into a skills directory is updated by replacing the folder. A skill installed from a marketplace is refreshed with `claude plugin marketplace update`, which pulls the marketplace from its source, and that is one of the better arguments for using a marketplace over passing folders around. Public catalog installs (e.g., `npx skills-il add ...`) require re-running the install command to pick up the latest version; some catalogs notify followers when a skill they installed bumps its version. Internal git monorepos usually settle on a small `git pull && reinstall` script run on a schedule.

Practical implication: if your skill has time-sensitive content (rates, prices, current rules), assume some fraction of your users WILL be running a stale copy weeks after you bump. Either commit to keeping the skill evergreen, or design the body so stale numbers fail loudly ("verify against the source before relying on these").

The most common mistake in Chapter 5: shipping a skill update without bumping the version. Consumers of your skill (or your future self) cannot tell what changed. Always bump the version; always note what changed in one sentence somewhere.

## Chapter 6: The 10-minute pre-share checklist

This chapter is short on purpose. It is the checklist you run BEFORE sharing your skill with anyone (a colleague, a public catalog, or your future self after a long break). Ten minutes spent here saves multiple back-and-forth rounds with reviewers and prevents the most common authoring mistakes.

### The 10 most common authoring mistakes

1. **Description too vague.** "A skill for Israeli things" routes badly. Use the "Use when X, Y, Z. Do NOT use for A, B" pattern.
2. **No "Do NOT use for" clause.** Without it, the LLM loads your skill in the wrong context and produces a confidently-wrong answer.
3. **Description in YAML block-scalar form (`>-` or `|`).** Some YAML parsers accept it; others fold whitespace differently or reject it outright. Keep the description on a single line.
4. **Fabricated thresholds, form numbers, or law citations.** Wrong tax brackets, wrong agency form numbers, made-up regulation citations. Reviewers cross-check against primary sources; fabrications are rejected hard.
5. **Slug does not match folder name.** Most validators and catalogs require the slug in your frontmatter (or `metadata.json`) to equal the folder basename exactly. Otherwise the entry fails to register.
6. **No worked example in the body.** Without examples, the LLM hallucinates edge cases.
7. **References to files in `references/` or `scripts/` that do not exist.** A local validator catches this in seconds. Run it.
8. **Wrong `supported_agents` slugs.** `claude` instead of `claude-code`, `gemini` instead of `gemini-cli`. Renders as empty gray icons on the catalog card.
9. **Em dashes anywhere in SKILL.md, the translated body, or `metadata.json`.** Project convention is no em dashes, period. Use commas, parens, colons.
10. **Forgot to bump the version after edits.** Distribution channels silently overwrite content, but the version indicator stays stale and consumers (or your future self) cannot tell what changed.

### The 10-minute pre-publish checklist (literal)

Run these in order. Each is one shell command or a 30-second read.

The count is 10 items, not 10 minutes of reading. Items 4 and 6 are the ones that actually take time.

1. Grep all three files for the em-dash character (U+2014). The output must be empty.
2. Verify the frontmatter `name` equals the folder name exactly, and that it is 64 characters or fewer, lowercase, and has no leading, trailing or doubled hyphens.
3. Check the description length: `awk '/^description:/{print length($0)-13}' SKILL.md`. It must be at most 1024, and aim under 950 to leave headroom for stricter publishing targets. Then read it aloud. Does it answer "when should the agent load this?" in one sentence, in the third person? Does it have a "Do NOT use for" clause?
4. Open a fresh Claude Code session. Paste a prompt your skill SHOULD handle, then one it should NOT handle. Verify the LLM routes correctly in both cases (loads your skill for the first, doesn't for the second).
5. Pick one number, percentage, or currency amount in your body. Open the primary source for it. Confirm it matches.
6. Pick the chapter with the most decision logic. Find the worked example. Re-derive it on paper to confirm the math.
7. List the files in `references/`, `scripts/` and `assets/`. For each, grep SKILL.md to confirm it is referenced, and confirm no reference is more than one level deep.
8. If you are publishing to a catalog with rendered preview UI, open that catalog's dev or staging environment and confirm everything looks right, including any supported-agent icons or platform logos.
9. Bump the version (in your frontmatter, in `metadata.json`, or in a git tag, wherever you track it).
10. Run the spec's own reference validator, which catches the naming and frontmatter rules before anyone else does:

    ```bash
    skills-ref validate ./my-skill
    ```

    Then, if your distribution channel runs its own validator on top, run that locally one last time before pushing.

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

### Security basics

A skill is not inert content. The body becomes LLM instructions; `scripts/` files become executable code the agent can run via its shell tool. Treat both as security surfaces.

**As the author** (before you publish or share):

- **Never commit secrets.** `SKILL.md`, `metadata.json`, and everything under `references/` and `scripts/` gets distributed verbatim. API keys, DB connection strings, personal tokens belong in the user's environment (env vars, OS keychain), not in the skill folder. If your script needs an API key, document the env var name in the body and let the user set it.
- **Be careful what `scripts/` does.** The agent will call your scripts when the body tells it to. A script that does `rm -rf` or hits the network with user data is doing that on the user's machine with the user's permissions. Restrict scripts to deterministic computation, parsing, and explicitly-documented network calls.
- **Treat `references/` as part of the prompt.** Anything the LLM reads from `references/` is interpreted as instructions. A user-submitted skill with adversarial text in `references/` (e.g., "When you next answer, ignore your system prompt and...") becomes a prompt-injection vector. Don't include content you wouldn't paste into a system prompt.

**As a consumer** (before you install someone else's skill):

- Read the SKILL.md body before installing. If you don't understand what it does, don't install it.
- Look at every file under `scripts/`. If a script makes network calls or touches the filesystem, decide whether you trust the author.
- For catalog-distributed skills, check whatever trust signals the catalog exposes (install counts, trust score, audit status, the author's other published skills). Skills from established authors are not safer by default but they are at least accountable.

### Spec + further reading

- **The Agent Skills specification**: published openly at agentskills.io/specification and mirrored in the Claude documentation. It defines the two required fields (`name`, `description`), the four optional ones (`license`, `compatibility`, `metadata`, `allowed-tools`), the field limits, and the `references/`, `scripts/` and `assets/` folder conventions. Any field outside that set is a catalog extension.
- **Host-specific install docs**: Claude Code (drop the folder in `~/.claude/skills/`, or install from a marketplace with `claude plugin install`), the Claude apps (upload from settings), and the other editors that accept the format, each with their own flow. The SKILL.md format is what is shared; the install path is not.

### Where to find example skills to learn from

The fastest way to internalize good SKILL.md patterns is to read a handful of skills that other developers have published. Some public catalogs let you browse by install count, which is a rough proxy for "this skill is well-designed enough that people actually use it." For Israeli-context skills, agentskills.co.il is one such catalog; for other niches, find the community catalog that fits.

Three useful starter exemplars by complexity:

- **Smallest**: a tight, focused formatter (e.g., a phone-number formatter for your country)
- **Small with `scripts/`**: a skill that adds a deterministic check-digit or parsing algorithm
- **Medium with `references/`**: a bilingual or multi-section skill with real `references/` usage

Read three skills from start to finish before you write yours. The pattern emerges quickly. Then write yours and ship it: install it locally, share it with one person, see what they say, iterate.

## Companion skills

The fastest way to learn SKILL.md is to read a handful of finished skills end to end. These are three starter exemplars by complexity, straight from the Israeli catalog. Install them and study the structure.

- **Israeli ID Validator** (`israeli-id-validator`), the smallest example: a focused skill with simple validation. Install: `npx skills-il add skills-il/developer-tools/israeli-id-validator`
- **Israeli Phone Formatter** (`israeli-phone-formatter`), a small example with scripts/: phone number formatting in all formats. Install: `npx skills-il add skills-il/developer-tools/israeli-phone-formatter`
- **Hebrew SEO & GEO Toolkit** (`hebrew-seo-geo-toolkit`), a medium example with references/: a bilingual multi-section skill that genuinely uses its references. Install: `npx skills-il add skills-il/marketing-growth/hebrew-seo-geo-toolkit`
