## 1.0.3 — 2026-05-26

### Hebrew
הוסף סעיף "סקילים נלווים" בסוף הגוף עם רשימה מובנית של הסקילים המומלצים ופקודות התקנה (`npx skills-il add ...`), כדי שהעוזר יוכל להפנות את הקורא לסקיל הנכון בזמן אמת. תוקנה גם הצורה הקנונית של פקודת ההתקנה לקורסים, מ־`npx skills add courses/<slug>` ל־`npx skills-il add skills-il/courses/<slug>` (הצורה הישנה לא עבדה: שם הבינארי לא נכון והנתיב לא נפתר ל־repo קיים).

### English
Added a "Companion skills" section at the end of the body with a structured list of recommended skills and their install commands (`npx skills-il add ...`), so the agent can route readers to the right skill in real time. Also corrected the canonical install command for courses from `npx skills add courses/<slug>` to `npx skills-il add skills-il/courses/<slug>` (the old form did not work: wrong binary name and the path did not resolve to a real repo).

## 1.0.2 — 2026-05-25

### Hebrew
ארבע מתוך שש התמונות בגוף הקורס היו עם תוויות באנגלית, מה שיצר אי־התאמה בולטת ב־UI: פרוזה עברית מימין, איור עם טקסט אנגלי במרכז. תוקן עבור הקהל הישראלי שזה הקורס מיועד לו. ה־prompts של chatbot-vs-agent, prompt-patterns, failure-modes-checklist, ו־chat-to-automation-stairs עודכנו לרנדר תוויות עבריות עם RTL נכון (פאנל ראשון בקריאה עברית מימין, אייקונים בצד התחלה ב־RTL, סולמות עולים מימין לשמאל). שמות מוצרים נשמרו באותיות לטיניות (Claude, ChatGPT, Gemini, n8n, Make, Zapier). שלוש תמונות נוספות (three-platforms, israeli-use-cases, skill-md-anatomy ב־course אחר לא רלוונטי לכאן) כבר היו ב־OK; israeli-use-cases היה עברית מ־v1.0.0, three-platforms עיקרו שמות מוצרים אז ההישארות באנגלית לגיטימית. כל ארבע התמונות הופקו מחדש דרך fal.ai ועברו בדיקה ויזואלית של רנדור הגליפים העבריים.

### English
Four of the six in-body images had English labels, creating jarring UI inconsistency: Hebrew prose on the right, English-labeled illustration in the middle. Fixed for the Hebrew-primary audience this course targets. Prompts for chatbot-vs-agent, prompt-patterns, failure-modes-checklist, and chat-to-automation-stairs rewritten to render Hebrew labels with correct RTL flow (first-read panel on the right in Hebrew reading order, icons on the start side in RTL, staircases ascending right-to-left). Product names kept in Latin script (Claude, ChatGPT, Gemini, n8n, Make, Zapier). The other two images were already fine: israeli-use-cases was Hebrew since v1.0.0, three-platforms is mostly product names so English is legitimate. All four PNGs regenerated via fal.ai and visually verified for Hebrew glyph rendering.

## 1.0.1 — 2026-05-25

### Hebrew
חמש תוספות אחרי ביקורת פערים. פרק 2 קיבל סעיף נפרד על **Claude Desktop + filesystem MCP** (הדרך היחידה למי שלא מפתח להגיד "תקרא את כל ה־PDFs בתיקייה" בלי להעלות אחד־אחד. רלוונטי מאוד לרואה חשבון עם תיקיית חשבוניות חודשית). פרק 2 גם קיבל סעיף על **העלאת קבצים ותמונות** (drag-drop של מסמכים סרוקים, OCR בעברית, צילומי מסך) וסעיף על **שיתוף הסוכן עם צוות** (GPT Store, Claude Team, Workspace Gems). פרק 4 השימוש ברואה חשבון מפנה עכשיו ל־**Code Interpreter / Analysis mode** לאריתמטיקה אמיתית (סוכני צ'אט לא באמת מחשבים) ול־Claude Desktop כאופציה למי שיש לו תיקיית PDFs. פרק 5 קיבל **דפוס כשל 5 חדש: הנתונים שלכם הולכים למקום כלשהו** (פרטיות, תיקון 13, מדיניות אימון של כל פלטפורמה, מה לעשות לפני שמדביקים נתוני לקוח). דפוס הכשל של עברית מוזרה הוזז ל־#6. תמונת checklist הופקה מחדש להציג 6 דפוסים. שורות סקירת פרקים 2 ו־5 עודכנו בהתאם.

### English
Five additions after a gap review. Chapter 2 gained a dedicated section on **Claude Desktop + filesystem MCP** (the only realistic way for a non-developer to say "read every PDF in this folder" without uploading one at a time; especially relevant for the accountant use case with a monthly invoice folder). Chapter 2 also added a **file and image upload** section (drag-drop of scanned documents, Hebrew OCR, screenshots) and a **sharing your agent with a team** section (GPT Store, Claude Team, Workspace Gems). Chapter 4's accountant use case now points at **Code Interpreter / Analysis mode** for real arithmetic (chat agents don't actually compute) and at Claude Desktop as an option for users with a folder of PDFs. Chapter 5 added **Failure mode 5: Your data goes somewhere** (privacy, Amendment 13, per-platform training-on-your-data policies, what to do before pasting client data). The Hebrew-quality failure mode moved to #6. The checklist image was regenerated to show 6 modes. Chapter overview rows for Ch 2 and Ch 5 updated to match.

## 1.0.0 — 2026-05-24

### Hebrew
שחרור ראשוני של הקורס. שישה פרקים לישראלים שאינם מפתחים: מה זה סוכן AI (לעומת צ'אטבוט), שלושת הפלטפורמות (Claude Projects, ChatGPT GPTs, Gemini Gems), ארבעה דפוסי prompt בסיסיים, ארבעה תרחישים ישראליים מלאים (רואה חשבון, עורך דין, מנהל שיווק, בעל עסק קטן), פרוטוקול אימות־לפני־אמון לזיהוי הזיות ונתונים מיושנים, ושלב הבא לאוטומציה ללא קוד (n8n, Make.com, Zapier).

### English
Initial release. Six chapters for non-technical Israelis: what an AI agent is (vs a chatbot), the three platforms (Claude Projects, ChatGPT GPTs, Gemini Gems), four foundational prompt patterns, four complete Israeli use cases (accountant, lawyer, marketer, small business owner), a verify-before-trust protocol for catching hallucinations and stale data, and the next step into no-code automation (n8n, Make.com, Zapier).
