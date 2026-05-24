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
