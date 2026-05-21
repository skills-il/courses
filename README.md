# skills-il/courses

Hebrew-first AI courses, authored as installable agent skills.

Every course in this repo is:
- A multi-chapter curriculum rendered with course-style UI at `https://agentskills.co.il/courses/<slug>`
- Installable into any AI assistant via `npx skills add courses/<slug>`

## Structure

Each course lives in its own top-level folder:

```
<course-slug>/
  SKILL.md           # English course content (chapters as ## Chapter N: headings)
  SKILL_HE.md        # Hebrew course content (mirrors English structure)
  metadata.json      # type=course, audience, level, chapters[], recommended_skills
  evidence.json      # every factual claim mapped to a source URL or computation
  CHANGELOG.md       # per-version bilingual summaries
  cover.png          # hero illustration (optional, ~1600x900)
  images/            # per-chapter illustrations (optional)
  scripts/           # optional computation files referenced by evidence.json
```

## Contributing

Courses in this repo are maintained by the skills-il team. To propose a new course, open an issue at [skills-il/skills-il](https://github.com/skills-il/skills-il/issues) or submit via the contact form at [agentskills.co.il/contact](https://agentskills.co.il/contact).

## License

Each course's `metadata.json` declares its license. Default is MIT. Forks of MIT-licensed sources preserve MIT.
