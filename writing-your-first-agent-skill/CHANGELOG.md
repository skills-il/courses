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
