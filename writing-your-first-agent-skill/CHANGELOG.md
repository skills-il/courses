## 1.1.0 — 2026-09-09

### Hebrew
- **הפקודה `claude skill install` לא קיימת יותר, והקורס לימד אותה חמש פעמים.** ב־Claude Code של היום אין בכלל שלב התקנה לסקיל אישי: שמים את התיקייה ב־`~/.claude/skills/<name>/` והיא נטענת בסשן הבא. הפצה נעשית דרך marketplaces (`claude plugin marketplace add`, `claude plugin install`). כל חמשת המקומות תוקנו, כולל תרחיש א', תרחיש ב', סעיף העדכונים והקריאה הנוספת.
- **תוקנה סתירה פנימית בין "שני שדות frontmatter" בפרק 1 לבין "שלושה שדות" בפרק 3.** התשובה הנכונה: שני שדות חובה (`name`, `description`) וארבעה אופציונליים (`license`, `compatibility`, `metadata`, `allowed-tools`). שלושת האחרונים לא הוזכרו בקורס בכלל.
- **נוסף סעיף על המגבלות שהמפרט קובע**, שהיו חסרות לגמרי והן הסיבה הנפוצה ביותר לכישלון בוולידציה: `name` עד 64 תווים בלי מקף פותח, סוגר או כפול; `description` עד 1024 תווים; `compatibility` עד 500; גוף SKILL.md מתחת ל-500 שורות; הוראות מתחת ל-5000 טוקנים. נוסף גם הכלל לכתוב תיאור בגוף שלישי, והמלכודת של Gemini Spark שסופר את גרשי ה־YAML ולכן דורש לכוון מתחת ל-950.
- **נוספה תיקיית `assets/`**, שהמפרט מגדיר לצד `references/` ו־`scripts/` ושהקורס לא הזכיר. טבלת lookup היא נתונים ולכן שייכת ל־`assets/`, וההמלצה בפרק 4 תוקנה בהתאם.
- **הוחלפו שני תקציבים מומצאים** ("קבצי references מתחת ל-5000 מילים", "סקריפט מתחת ל-200 שורות") בתקציבים שהמפרט באמת קובע, כולל הכלל לשמור הפניות בעומק רמה אחת.
- **תוקן ההסבר למה קטלוגים משתמשים ב־metadata.json.** הנימוק הישן היה ש־parser מחמיר דוחה מפתחות מקוננים, אבל `metadata` הוא היום שדה מוכר במפרט. הנימוק הנכון הוא שהוא מיפוי לערכי מחרוזת בלבד, ושנתוני קטלוג לא צריכים לעלות בקונטקסט של הסוכן.
- **הוסר "ה־registry של Anthropic (כשיהיה זמין)"**, שלא קיים בשם הזה, והוחלף במסלולים האמיתיים: marketplaces של תוספים, ה־repo הפתוח `anthropics/skills`, והעלאת zip מההגדרות באפליקציות Claude.
- **נוסף `skills-ref validate` לצ'ק ליסט** ככלי הוולידציה הרשמי של המפרט, ונוספו בדיקת אורך תיאור ובדיקת שם התיקייה.
- **evidence.json נבנה מחדש.** אף אחד מ-11 הציטוטים הקודמים לא הופיע בדף שאליו הופנה, וארבעה קישורים החזירו 404 כי הם הצביעו על `github.com/skills-il/skills-il`, repo שלא קיים. הקובץ עומד עכשיו על 10 רשומות מול המפרט הפתוח והדוקומנטציה של Claude Code, וכל ציטוט אומת מילה במילה מול הדף החי.
- עודכנו שאלות 2, 4 ו-8 בבוחן, ששתיים מהן הצביעו על תשובות שכבר אינן נכונות.

### English
- **The `claude skill install` command no longer exists, and the course taught it five times.** In current Claude Code there is no install step for a personal skill: put the folder at `~/.claude/skills/<name>/` and it loads next session. Distribution is via marketplaces (`claude plugin marketplace add`, `claude plugin install`). All five occurrences fixed, including Scenario A, Scenario B, the updates section and the further reading.
- **Fixed an internal contradiction** between "two frontmatter fields" in Chapter 1 and "three frontmatter fields" in Chapter 3. The correct answer is two required (`name`, `description`) and four optional (`license`, `compatibility`, `metadata`, `allowed-tools`). The last three were not mentioned anywhere in the course.
- **Added the limits the spec sets**, which were absent entirely and are the most common reason a first submission fails validation: `name` up to 64 characters with no leading, trailing or doubled hyphen; `description` up to 1024; `compatibility` up to 500; SKILL.md body under 500 lines; instructions under 5000 tokens. Added the third-person description rule, and the Gemini Spark trap where the YAML quotes are counted so authors should aim below 950.
- **Added the `assets/` directory**, which the spec documents alongside `references/` and `scripts/` and the course never mentioned. A lookup table is data and therefore belongs in `assets/`; the Chapter 4 advice was corrected accordingly.
- **Replaced two invented budgets** ("references files under 5000 words", "scripts under 200 lines") with the ones the spec actually states, including the rule to keep file references one level deep.
- **Corrected the reason catalogs use metadata.json.** The old rationale was that a strict parser rejects nested keys, but `metadata` is now a recognised spec field. The real reason is that it maps to string values only, and that catalog data should not cost the agent context.
- **Removed "the Anthropic skill registry (when generally available)"**, which does not exist under that name, and replaced it with the real routes: plugin marketplaces, the open-source `anthropics/skills` repo, and zip upload from settings in the Claude apps.
- **Added `skills-ref validate` to the checklist** as the spec's own validator, plus a description-length check and a folder-name check.
- **evidence.json rebuilt.** None of the previous 11 quotes appeared on the page it cited, and four URLs returned 404 because they pointed at `github.com/skills-il/skills-il`, a repo that does not exist. The file is now 10 entries against the open specification and the Claude Code docs, every quote verified verbatim against the live page.
- Updated quiz questions 2, 4 and 8; two of them keyed answers that are no longer correct.

## 1.0.12 — 2026-06-02

### Hebrew
- עריכת סגנון עברית לקורס כתיבת סקיל: נשמרו המונחים הטכניים הנדרשים, אך הוחלפו ניסוחים מאונגלזים כמו "מודל מנטלי", "מכניקה", "דיפולטי", "רנדרית" ו"איטרציה" בניסוח עברי טבעי יותר.

### English
- Hebrew style pass for the skill-authoring course: preserved required technical terms, while replacing Anglicized Hebrew such as "mental model", "mechanics", "default", "rendered", and "iteration" with more natural Hebrew.

## 1.0.11 — 2026-05-26

### Hebrew
הוסרו הפניות תמונה מתוך SKILL.md ו־SKILL_HE.md בריפו הציבורי. התמונות עצמן ממשיכות לרוץ באתר (frontend/public/courses/<slug>/), אבל המקור הציבורי שהמתקינים דרך CLI מקבלים נקי מקישורי `![](*.png)` כדי שלא יראו שורות תמונה שבורות בעוזר ה־AI שלהם. גרסה image-rich של הקובץ נשמרת ב־frontend/scripts/sync-courses/sources/ ומשמשת לרינדור באתר בלבד.

### English
Removed `![](*.png)` image references from SKILL.md and SKILL_HE.md in the public repo. The images themselves are still served by the website (frontend/public/courses/<slug>/), but the public source that CLI installers receive is now clean of image refs so they don't see broken image rows in their AI assistant. An image-rich copy of each file is kept in frontend/scripts/sync-courses/sources/ and used for website rendering only.

## 1.0.10 — 2026-05-26

### Hebrew
הוסף סעיף "סקילים נלווים" בסוף הגוף עם רשימה מובנית של הסקילים המומלצים ופקודות התקנה (`npx skills-il add ...`), כדי שהעוזר יוכל להפנות את הקורא לסקיל הנכון בזמן אמת. תוקנה גם הצורה הקנונית של פקודת ההתקנה לקורסים, מ־`npx skills add courses/<slug>` ל־`npx skills-il add skills-il/courses/<slug>` (הצורה הישנה לא עבדה: שם הבינארי לא נכון והנתיב לא נפתר ל־repo קיים).

### English
Added a "Companion skills" section at the end of the body with a structured list of recommended skills and their install commands (`npx skills-il add ...`), so the agent can route readers to the right skill in real time. Also corrected the canonical install command for courses from `npx skills add courses/<slug>` to `npx skills-il add skills-il/courses/<slug>` (the old form did not work: wrong binary name and the path did not resolve to a real repo).

## 1.0.9 — 2026-05-24

### Hebrew
שלוש תוספות קצרות שסוגרות את הפערים הקטנים שזיהיתי ב־v1.0.7. נוסף סעיף "אורך הגוף עולה ב־tokens" בפרק 2 שמסביר שכל מה שבגוף נטען לקונטקסט בכל ניתוב, ושטבלאות ארוכות ופרוזה מפורטת שייכות ל־`references/` בגלל זה. נוסף שדה `recommended_skills` בדוגמה של metadata.json בפרק 3 עם בולט שמסביר אותו ("סקילים שמשתמשים באמת צריכים לצד שלכם, לא קישורים פרסומיים"). נוסף סעיף "איך עדכונים מגיעים למי שכבר התקין" בפרק 5 שמכסה: המפרט לא מגדיר auto-update, כל סביבה דורשת re-install ידני אחרי בamp גרסה, והשלכה מעשית לתוכן שתלוי בזמן (תניחו שחלק מהמשתמשים ירוצו על עותק ישן).

### English
Three short additions closing the minor gaps flagged after v1.0.7. Added a "Body length costs tokens" section in Chapter 2 explaining that everything in the body loads into context on every route, and that long tables and detailed prose belong in `references/` for this reason. Added a `recommended_skills` field to the Chapter 3 metadata.json example with a bullet explaining it ("skills users genuinely need alongside yours, not promotional cross-links"). Added a "How updates reach existing installers" section to Chapter 5 covering: spec doesn't define auto-update, every host requires manual re-install after a version bump, and the practical implication for time-sensitive content (assume some users will be running stale copies).

## 1.0.8 — 2026-05-24

### Hebrew
תיקון מהיר: שני em dashes (U+2014) חמקו לתוך SKILL.md ב־1.0.7 ועברו את ה־grep שלי (regex לא לכד אותם בלי הצורה הנכונה של ה־escape). אומתו עם python3 שעובד נכון על תווים מחוץ ל־ASCII. שניהם הוחלפו: אחד בפסיק במשפט "המקבל חייב לחלץ קודם", ואחד בנקודה במשפט על חיפוש docs של Anthropic. אין שינויי תוכן אחרים.

### English
Quick fix: two em dashes (U+2014) leaked into SKILL.md in 1.0.7 and passed my shell grep (the regex didn't catch them without proper escaping). Verified with python3 which handles non-ASCII characters correctly. Both replaced: one with a comma in the "recipient must extract first" sentence, one with a period in the Anthropic docs sentence. No other content changes.

## 1.0.7 — 2026-05-24

### Hebrew
שלוש תוספות לפרק 6 וסעיף ב' שסגרו פערים אמיתיים. נוסף סעיף "בסיס אבטחה" בפרק 6 שמכסה את שני הצדדים: לכותב הסקיל (אל תכניסו secrets, היזהרו עם scripts/, התייחסו ל־references/ כחלק מה־prompt בגלל וקטור prompt injection), ולצרכן הסקיל (קראו את גוף ה־SKILL.md לפני התקנה, סקירת scripts/, אותות אמון של הקטלוג). תרחיש ב' (שיתוף עם צוות) הורחב כדי להסביר את המכניקה של ZIP בצד המקבל (חייב לחלץ קודם, רוב הסביבות לא מתקינות מ־ZIP ישירות, נקודת שורש של SKILL.md). נוסף סעיף "מפרט וקריאה נוספת" עם הפניה ל־docs הרשמיים של Anthropic ל־Agent Skills ולתיעוד ההתקנה הספציפי לכל סביבה.

### English
Three additions to Chapter 6 and Scenario B that close real gaps. Added a "Security basics" section in Chapter 6 covering both sides: author (never commit secrets, be careful with scripts/, treat references/ as part of the prompt because of prompt-injection risk) and consumer (read the SKILL.md before installing, review scripts/, look at catalog trust signals). Expanded Scenario B (share with team) to explain the recipient-side ZIP mechanics (must extract first, most hosts won't install from a ZIP directly, SKILL.md must be at the extracted folder's root). Added a "Spec + further reading" section pointing at Anthropic's official Agent Skills docs and host-specific install docs.

## 1.0.6 — 2026-05-24

### Hebrew
סגירה של שני הפערים שנדחו ב־1.0.5. ה־slugs של פרקים 3 ו־5 שונו לשמות שתואמים את התוכן: `metadata-and-bilingual` → `extending-the-format`, `publishing-to-catalog` → `sharing-your-skill`. ההפקה החדשה של תוכן הפרקים מבוצעת לפי sort_order ולא לפי slug, אז התוכן לא נשבר. שלוש תמונות בתוך הפרקים נוצרו מחדש כדי לתאם לתוכן החדש: `metadata-json-structure.png` (עכשיו מציגה ערכים שטוחים), `pre-publish-checklist.png` (סעיף #4 שונה ל"fresh session routing" במקום "Hebrew naturalness"), ו־`publication-flow.png` (שונתה מטיימליין של פרסום לקטלוג ל־2x2 grid של ארבעת מסלולי השיתוף).

### English
Closed the two gaps deferred in 1.0.5. Renamed chapter 3 and chapter 5 slugs to match content: `metadata-and-bilingual` → `extending-the-format`, `publishing-to-catalog` → `sharing-your-skill`. Chapter content is extracted by sort_order not slug, so prose stays intact. Regenerated the three inline images to match the new content: `metadata-json-structure.png` (now flat-string values), `pre-publish-checklist.png` (item #4 swapped to "fresh session routing" from "Hebrew naturalness"), and `publication-flow.png` (changed from a publish-to-catalog timeline to a 2x2 Personal/Team/Internal/Public grid).

## 1.0.5 — 2026-05-24

### Hebrew
ניקוי חורים שנשארו מהמעבר לקורס גנרי. עודכן `who_is_this_for` להסיר את ההפניה ל"קטלוג skills-il". עודכנו `learning_outcomes` כך שלא יזכירו את ה־pipeline של skills-il (sync, ציון אמון) או את הסיבה ש"skills-il משתמש בקובץ נפרד". הוסר `skills-il-skill-creator` מ־`recommended_skills` (פלטפורמה־ספציפי). עודכנו 3 prompts של תמונות שהיו עומדים בסתירה לתוכן הפרק החדש: `metadata-json-structure.png` עכשיו מתאר ערכים שטוחים בלי `(he+en)`, `pre-publish-checklist.png` החליף את הסעיף "Hebrew naturalness" ב"fresh session routing", ו־`publication-flow.png` שונה מטיימליין של פרסום לקטלוג ל־2x2 grid של ארבעת מסלולי השיתוף. הדוגמה בפרק 2 שונתה מ־`israeli-id-validator` ל־`id-validator` כדי להתאים לפרק 3, עם פירוש הפנימי `(such as the Israeli תעודת זהות)` שנשמר כדוגמה ללימוד "תנו שם בשתי שפות".

### English
Cleanup pass on holes left after the generic-course rewrite. Updated `who_is_this_for` to drop "for the skills-il catalog". Updated `learning_outcomes` so they no longer reference the skills-il pipeline (sync, trust score) or "why skills-il uses a separate file". Removed `skills-il-skill-creator` from `recommended_skills` (platform-specific). Rewrote 3 image prompts that contradicted the new chapter content: `metadata-json-structure.png` now describes flat-string values (no `(he+en)`), `pre-publish-checklist.png` swapped "Hebrew naturalness" for "fresh session routing", and `publication-flow.png` changed from a "publish to catalog" timeline to a 2x2 grid of the four sharing paths. Chapter 2's frontmatter example renamed `israeli-id-validator` → `id-validator` to match Chapter 3, keeping the inner `(such as the Israeli תעודת זהות)` parenthetical as the "name terms in both languages" teaching example.

NOTE: the three modified image prompts (metadata-json-structure, publication-flow, pre-publish-checklist) describe the new content but the actual PNG files are still the old rendered images. Regenerate with `pnpm tsx frontend/scripts/generate-course-images.ts ~/dev/courses/writing-your-first-agent-skill --filter <name> --force` when ready (~90-150s per image via fal.ai queue).

## 1.0.4 — 2026-05-24

### Hebrew
דוגמת ה־metadata.json בפרק 3 שונתה כך שתשתמש במחרוזות שטוחות (display_name: "ID Validator") במקום באובייקטים `{he, en}`. אובייקטים דו־לשוניים זאת לא הצורה הדיפולטית של sidecar במפרט סקילים. חלק מהקטלוגים מקבלים את זה, וזה מוזכר כעת כהערה של משפט אחד בסוף הסעיף ולא משתלט על הדוגמה. השם בדוגמה שונה מ־`israeli-id-validator` ל־`id-validator` כדי להיות גנרי. תיאורי השדות (display_name/display_description/tags) קוצרו בהתאם.

### English
The Chapter 3 metadata.json example switched from `{ he, en }` objects to flat strings (display_name: "ID Validator"). Bilingual objects are not the default sidecar shape for the skills format; some catalogs accept them, now mentioned as a one-sentence note at the end of the field list rather than being the primary example. Renamed the example slug from `israeli-id-validator` to `id-validator` to keep it generic. Field descriptions (display_name/display_description/tags) shortened to match.

## 1.0.3 — 2026-05-24

### Hebrew
פרק 3 צומצם כך שלא ימליץ על קובץ SKILL_HE.md כברירת מחדל. SKILL_HE.md הוא קונבנציה ספציפית ל־skills-il, לא חלק מהמפרט של Anthropic, ולא משהו שכל כותב סקיל אמור ליישם. הסעיפים "קובץ ליווי לכל שפה", "הפניה לסקילים אחרים בפרוזה לא־לטינית", ו"דוגמה ללימוד: סקיל דו־לשוני באיכות גבוהה" הוסרו לחלוטין. הטעות הנפוצה בפרק 3 שונתה מ"תרגום מילולי שנקרא שבור" ל"לנחש את הסכמה של ה־sidecar במקום לקרוא את מדריך התרומה של הקטלוג". בפרק 6, טעות #3 (קלקות בעברית) הוחלפה ב"תיאור ב־YAML block scalar" שזו טעות כללית ש־parsers דוחים. סעיף #4 ברשימת התיוג ("קראו את הגוף המתורגם בקול") הוחלף ב"פתחו סשן Claude Code טרי ובדקו ניתוב חיובי + שלילי".

### English
Chapter 3 trimmed so it no longer recommends a SKILL_HE.md companion as a default practice. SKILL_HE.md is a skills-il-specific convention, not part of the Anthropic spec, and not something every skill author should implement. Dropped the "per-language companion file", "cross-referencing other skills in non-Latin prose", and "study example: a high-quality bilingual skill" subsections entirely. Replaced the Chapter 3 closing-mistake from "literal translation reads broken" to "guessing your target catalog's sidecar schema instead of reading its contribution guide". In Chapter 6, replaced mistake #3 (Hebrew calques) with "Description in YAML block-scalar form (>- or |)", which is a general parser-rejection bug. Pre-publish checklist item #4 ("read translated body aloud") replaced with "open a fresh Claude Code session and verify positive + negative routing."

## 1.0.2 — 2026-05-24

### Hebrew
הקורס נכתב מחדש כך שיהיה גנרי לכתיבת סקילים, ולא ספציפי לפלטפורמת skills-il. הוסרו ההפניות החוזרות לקטלוג skills-il, ל־sync pipeline, לציון אמון, ולמספרי התקנות מתוך גוף הפרקים. סעיף "ההרחבה של skills-il" בפרק 1 הוסר; פרק 3 מציג כעת את דפוס ה־sidecar בצורה גנרית עם הסכמה של agentskills.co.il כדוגמת עבודה אחת. פקודות `npx skills-il add ...` הוסרו מכל הדוגמאות, וכל הציטוטים של סקילים בקטלוג הוחלפו בהמלצה גנרית "תמצאו סקיל כזה בקטלוג היעד שלכם". טעויות הכתיבה בפרק 6 נוסחו מחדש כך שלא ייחסו את עצמן למנגנונים של skills-il (sync pipeline, update-skill admin flow).

### English
The course was rewritten to be a general agent-skill authoring course rather than a skills-il platform-specific one. Removed repeated references to the skills-il catalog, the sync pipeline, the trust score, and install counts from chapter bodies. Dropped the "skills-il extension" subsection from Chapter 1; Chapter 3 now presents the sidecar pattern generically with the agentskills.co.il schema as one worked example. Stripped all `npx skills-il add ...` install commands from worked examples, replacing catalog-specific skill citations with "find a skill like this in your target catalog" framing. Chapter 6 mistakes rewritten so they no longer reference skills-il mechanisms (sync pipeline, update-skill admin flow).

## 1.0.1 — 2026-05-24

### Hebrew
התיאור הקצר של הקורס (display_description) עודכן כדי להסיר את ניסוחי "agent skill" ו"קטלוג skills-il" שכבר לא תואמים את גוף הקורס (שכותב כעת על סקיל בצורה גנרית, לא רק על הפורמט של Anthropic). תמונת הכריכה של הקורס נוצרה מחדש כדי שגם הטקסט עליה ישקף את המסגור החדש.

### English
Updated the course display_description to drop the "agent skill" and "skills-il catalog" framing that no longer matched the body (which was rewritten to talk about skills generically, not Anthropic-specifically). Regenerated the course cover image so the text on the cover also reflects the new framing.

## 1.0.0 — 2026-05-24

### Hebrew
שחרור ראשוני של הקורס. שישה פרקים מכסים את כתיבת הסקיל הראשון: המודל המנטלי (סקיל לעומת MCP / system prompt / CLI), האנטומיה של SKILL.md, ההרחבה של skills-il (metadata.json + SKILL_HE.md), references/ לעומת scripts/, תהליך השחרור לקטלוג, ורשימת תיוג של 10 דקות לפני פרסום. דוגמאות מהקטלוג: מאמת תעודת זהות (israeli-id-validator), מפרמט טלפונים ישראלי (israeli-phone-formatter), ערכת כלים לקידום אתרים ו-GEO בעברית (hebrew-seo-geo-toolkit).

### English
Initial release. Six chapters covering how to write a first agent skill: the mental model (skill vs MCP / system prompt / CLI), SKILL.md anatomy, the skills-il extension (metadata.json + SKILL_HE.md), references/ vs scripts/, the publication flow, and a 10-minute pre-publish checklist. Catalog exemplars referenced: israeli-id-validator, israeli-phone-formatter, hebrew-seo-geo-toolkit.
