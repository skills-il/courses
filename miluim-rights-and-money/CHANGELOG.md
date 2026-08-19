# Changelog

## 1.1.2 — 2026-08-19

### Fixed

- The Tax Authority business grant was described as having short windows where "delay can cost you the entire grant". Verified against the service page: windows open on staggered dates but every eligibility period from November-December 2024 onward closes on 31 December 2026, and only the 2024 periods expire sooner. There is a real deadline, but not the near-term scramble the old wording implied. Corrected in all three places it appeared, in both languages.

## 1.1.1 — 2026-08-18

### Fixed

- Cited the extension order behind the days 31-60 protection (ילקוט הפרסומים 14498, 29.04.2026) and added the two details in it that decide real cases: the extra 30 days apply only from 29 April 2026 onward even though the order otherwise runs from 1 January, and the 60 days are not counted on the calendar year alone, since prior-year days count where service ran continuously with breaks of up to five days.

## 1.1.0 — 2026-08-18

Synchronised with `israeli-miluim-manager` v2.0.0, which corrected several facts this course had inherited.

### Fixed

- **The special grant (tagmul meyuchad) was described as a flat 133.33 NIS per day across both the 32-60 and the 60-plus bands.** Only days 32-60 are flat. Beyond day 60 the rate depends on the service year: 133 for tzav 8 in 2024, 133/60/40 by array for tzav 8 in 2025, and six activity-tier bands from 133 down to 30 for 2026 under any order type. Quoting the top figure overstated the entitlement for most reservists.
- **Chapter Two, on how the tagmul is calculated, omitted the 40% supplement entirely.** It is the largest single component and its remainder rule (divide the days by 7, only the remainder earns it) is the most common source of a wrong figure. A reader checking Bituach Leumi's arithmetic without it would conclude they had been overpaid.
- **Job protection was attributed to a 2024 statutory amendment.** The 30-day window is section 41A(b) of the Discharged Soldiers (Return to Work) Law and is permitted only by the Employment Committee at the Ministry of Defence; days 31 to 60 come from a collective-agreement extension order and are permitted only by the Supervision Committee at the Ministry of Labour. Petitioning the wrong committee wastes the window.
- **The self-employed 25% supplement was described as applying to the base calculation.** It is added to the tagmul including its 40% supplement, and the cap binds the two together.

### Added

- The two-layer structure of the special grant, with a worked example showing that 70 shamap days earns days 32-60 (3,866.57 NIS) on top of the beyond-60 rate.
- The 25% special tax on the additional grant, and that it confers no tax credit points despite being priced in them.
- The permanent ban on dismissal because of reserve service, under which such a dismissal is void.
- Ministry of Defence funded legal representation for reservists dismissed, summoned to a hearing, or placed on unpaid leave over their service.

### Changed

- `evidence.json` was migrated from a legacy schema whose field names the verifier does not read, which meant the course's facts had never actually been source-checked. It now carries 18 canonical entries with verbatim snippets.
- Companion-skill routing for a dismissal now points at `israeli-miluim-manager` rather than `israeli-bituach-leumi`.

## 1.0.1 — 2026-06-02

### Hebrew
- עריכת סגנון עברית לקורס המילואים: הוחלפו ניסוחים מתורגמים מדי ומונחי ממשק מאונגלזים בניסוח טבעי יותר, בלי שינוי הטענות העובדתיות או הסכומים.

### English
- Hebrew style pass for the miluim course: replaced translationese phrasing and Anglicized UI terms with more natural Hebrew, without changing factual claims or amounts.

## 1.0.0 — 2026-05-30

### Hebrew
- גרסה ראשונית: קורס בן 6 פרקים על תגמולי מילואים, זכויות וגבייה, במיקוד על עצמאים.

### English
- Initial release: a 6-chapter course on reserve-duty compensation, rights, and claiming, focused on the self-employed.
