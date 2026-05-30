---
name: miluim-rights-and-money
description: A 6-chapter course on Israeli reserve-duty (miluim) compensation, focused on the self-employed. How tagmul is calculated, the Tax Authority business grant, long-service grants, job protection, and how to claim.
license: MIT
---

# Miluim Rights and Money

A course for Israeli reservists, and especially the self-employed and business owners, who want to understand exactly what reserve duty (miluim) pays, which track applies to them, and how to claim every shekel they are owed.

You can read this course here on the site, or open it in your AI assistant at https://agentskills.co.il/courses/miluim-rights-and-money and ask it questions about your own service.

## Overview

Reserve compensation in Israel is not one number. It is a base daily tagmul with a cap and a floor, a different calculation for employees versus the self-employed, a separate Tax Authority grant for business owners whose income dropped, a ladder of extra grants for long service, and a set of family and job protections. Most reservists collect the base and never discover the rest.

The self-employed are hit hardest by this. An employee's tagmul is handled mostly by their employer and Bituach Leumi behind the scenes. A self-employed reservist has to understand the system, file the right claims, and actively pursue the business grant, or it simply does not arrive. The single most common mistake this course exists to prevent is a self-employed reservist who collected the standard tagmul, assumed that was everything, and left the Tax Authority business grant and the long-service grants unclaimed.

Every number in this course is indexed to 2025-2026 and changes year to year. Reserve compensation figures are reset annually and several were changed during the war period. Treat each amount as a starting point to confirm against the official source linked in each chapter, not as a promise.

## How to use this course

Read the chapters in order on the first pass. Chapter 1 explains the pay mechanism and which track you are on, which everything else builds on. Chapter 3 is the one self-employed readers should not skip: it is the track that does not pay out unless you pursue it.

Each chapter pairs the "what you are owed" with a catalog skill that handles the tactical follow-up: tracking your service days, generating the right form, or checking a specific Bituach Leumi benefit. The course teaches what to claim and why; the skills handle the mechanical filing.

If you open this course in your AI assistant (link at the top of the page), you can give it your real service dates and income and it will apply these frameworks to your situation. This is a planning aid, not binding legal or tax advice. For a disputed claim or a complex business case, consult a professional.

## Chapter 1: How Reserve Pay Actually Works

Before any numbers, you need to know who pays you and which track you are on, because the two tracks behave completely differently. Get this wrong and you wait for money that was never going to arrive automatically.

Reserve compensation (tagmul miluim) is paid by Bituach Leumi (National Insurance) under Chapter 12 of the National Insurance Law. It is not paid by the army. The army certifies your service days; Bituach Leumi pays the compensation.

### The two tracks

![Employee track versus self-employed track for reserve pay](pay-mechanism.png)

Which track you are on decides whether you do anything at all:

- **Employee track:** your employer keeps paying your salary during reserve duty, and Bituach Leumi reimburses the employer. You usually do nothing and see no interruption in pay. The money flows employer to you, Bituach Leumi to employer.
- **Self-employed and multi-employer track:** nobody pays you a salary to be reimbursed. You file a personal claim directly to Bituach Leumi (using the form generated in your IDF reserve personal area). If you do not file, you are not paid.

This is the core asymmetry of the whole system. The employee is opted in by default. The self-employed reservist is opted out by default and has to opt in, repeatedly, for every entitlement in this course.

### You have twelve months to claim, not thirty days

A widespread myth is that you have 30 days to claim reserve compensation. That is wrong, and believing it causes panic and mistakes. The Bituach Leumi claim deadline is twelve months from the service date, and you also have twelve months to appeal a Bituach Leumi decision.

The "30 days" that floats around refers to something else entirely: during the war period, the reserve grant deposited in your bank account is protected from being frozen or seized for 30 days after it lands. That is a protection on the money, not a deadline to claim it. Do not confuse the two.

For tracking your service days and generating the claim form, the `israeli-miluim-manager` skill handles the mechanical side. This course tells you what you are entitled to; that skill helps you file for it.

## Chapter 2: How Your Tagmul Is Calculated

The base reserve compensation has a formula, a ceiling, and a floor. Knowing them lets you sanity-check what Bituach Leumi paid you, which matters most for the self-employed, whose calculation is the one most likely to come out wrong.

### The cap and the floor

![The daily tagmul ceiling and floor](tagmul-cap-floor.png)

Reserve compensation is computed per day of service, bounded at both ends. Effective 1 January 2026:

| Bound | Daily amount | Monthly equivalent |
|---|---|---|
| Maximum (ceiling) | 1,730.33 NIS | 51,910 NIS |
| Minimum (floor) | 328.76 NIS | 9,863 NIS |

These are precise published rates with an effective date, and they reset annually: verify the current figures at the Bituach Leumi reserve-service rates page before relying on them. The monthly column is the daily figure times 30.

If your normal income is high, your daily tagmul is capped at the ceiling. If it is low or zero, you still receive at least the floor. The 2025 figures were slightly lower and were adjusted during the war period.

### The self-employed calculation

![Self-employed tagmul: prior installments divided by ninety, plus a supplement](self-employed-formula.png)

For an employee, the daily tagmul is based on the prior three months of salary. For the self-employed, it is based on your reported income (the basis on which you paid advance National Insurance contributions, mkdamot, before your service), prorated to a daily figure. As a rule of thumb that is roughly your reported installments for the three months before service divided by 90, but Bituach Leumi derives the exact daily base from your assessment, so their figure may not literally match your last three mkdamot receipts. Two things make the self-employed calculation special:

- **A 25% supplement.** The self-employed receive an additional 25% on top of the base calculation, applied within the cap and floor above (when the ceiling binds, the supplement does not push you past it).
- **A war-period favorable rule.** Your tagmul is computed on the higher of your reported installments or your final annual tax assessment, and recalculated after the assessment is finalized. If your reported installments understated your real income, the later assessment can increase what you are owed.

The most common self-employed mistake is treating the first payment as final. It is provisional. When your annual assessment is filed, revisit your tagmul: the recalculation can owe you more. The `israeli-freelancer-ops` skill helps you keep the income records that drive this recalculation.

## Chapter 3: The Self-Employed Business Grant, Decoded

This is the chapter to not skip. Beyond the per-day tagmul in chapter 2, a self-employed reservist whose business lost income because of reserve service can claim a separate grant, and most do not, because it lives at a different agency and does not arrive on its own.

### Two schemes, and which one is live

![The closed IDF scheme versus the active Tax Authority grant](two-tracks.png)

There have been two business-support schemes, and the confusion between them costs people money:

- **The older IDF support-fund scheme** (for reservists with long service since October 2023 plus a turnover drop): its application window has closed. If someone tells you to apply there, that ship has sailed.
- **The current track: the Tax Authority grant for reservist business owners** (מענק לעוסקים משרתי מילואים), compensating indirect economic damage. This is the live 2025-2026 track, and it is administered by Reshut HaMisim, not Bituach Leumi.

### Who qualifies and how it is figured

The Tax Authority grant is built around days served under Order 8 (tzav 8) plus a measurable drop in turnover:

- **Days threshold:** 30 cumulative days, or 21 continuous days, of Order 8 reserve service, counted within each defined eligibility period. The grant is issued in waves, each with its own qualifying dates and claim window, so the day count is per period, not an open-ended lifetime total.
- **Income test:** a decline in turnover compared with the matching period in the prior year.
- **Calculation:** the grant is based on the turnover decline adjusted for expenses you saved while not operating. Exempt dealers (osek patur) receive fixed bracket amounts rather than a turnover-based calculation.
- **Filing:** online through the Tax Authority, with defined claim windows per service period. The windows close, so this is the one entitlement where delay can cost you the entire grant.

The lesson of this chapter is structural: the per-day tagmul (chapter 2) and the business grant (this chapter) are two separate claims at two separate agencies. Collecting one does not collect the other. The `israeli-miluim-manager` skill helps you track the Order 8 days that determine your eligibility here.

## Chapter 4: Long-Service Grants and Extras

On top of the daily tagmul, reservists who serve longer stretches earn a ladder of additional grants. These are real money that scales with days served, and like everything else in this system, you should verify you received the tier you earned.

### The additional-grant ladder

![The additional-grant ladder by reserve days served](long-service-staircase.png)

The additional reserve grant (tagmul nosaf) is tiered by the number of reserve days in the year. The 2025 tiers were approximately:

| Days served (in the year) | Additional grant |
|---|---|
| 10 to 14.5 days | 1,452 NIS |
| 15 to 19.5 days | 2,904 NIS |
| 20 to 36.5 days | 4,356 NIS |
| 37 or more days | 5,808 NIS |

On top of that, a special grant (tagmul meyuchad) of roughly 133.33 NIS per full combat day applies to long combat service (in the 32 to 60 day and 60 day-plus bands), and a personal-expense grant applies to shorter service (5 to 9.5 days). These figures are year-indexed; confirm the current tier amounts before relying on them.

### Family support

Reservists serving long Order 8 stretches (around 40 days or more) may receive a family grant of approximately 500 NIS per child up to age 14, rising for combat service. The exact amounts and eligibility windows have changed across the war period, so treat the family-grant figures as indicative and confirm the current rule. The `israeli-bituach-leumi` skill is the reference for which National Insurance grants you and your family currently qualify for.

## Chapter 5: Job and Business Protection

Compensation is only half the picture. The law also protects your job and your standing while you serve, and reservists who do not know these protections sometimes accept treatment they could have refused.

### You cannot be fired for serving

![Job protection for reservists under the Discharged Soldiers Law](job-protection.png)

The Discharged Soldiers (Return to Work) Law of 1949 (חוק חיילים משוחררים (החזרה לעבודה), תש"ט-1949) bars an employer from dismissing an employee because of reserve service. An employer who wants to dismiss a reservist during or around their service must go through an employment committee (va'adat ta'asuka) and obtain a permit; they cannot simply fire you.

A 2024 amendment, passed as reserve call-ups lengthened, extended the protected period: reservists who served long stretches (60 or more days in the relevant war-period window) gained a longer post-service window during which dismissal is restricted. If you were dismissed close to a long reserve stint, this protection may apply to you.

### The self-employed angle

The job-protection law is written for employees, so the self-employed do not get "no-firing" protection. Their protection is financial: the chapter 3 Tax Authority grant exists precisely because a self-employed reservist has no employer to keep their income flowing. If you are self-employed, your "job protection" is making sure you actually claim that grant.

For employees navigating a dismissal or a dispute tied to reserve service, the `israeli-bituach-leumi` skill points to the relevant rights and the bodies that enforce them.

## Chapter 6: Claiming What You Are Owed

You now know what exists. This chapter is the order of operations to collect it, and the deadlines that decide whether you can.

### The claim path

![The reserve-pay claim path and deadlines](claim-timeline.png)

The mechanical steps for a self-employed or multi-employer reservist:

1. **Confirm your service days** in your IDF reserve personal area. This is the record everything else is built on.
2. **Generate and file the Bituach Leumi claim** (the reserve-compensation form produced from your personal area) for your per-day tagmul. You have twelve months from the service date.
3. **File the Tax Authority business grant separately** (chapter 3) if you meet the Order 8 day threshold and your turnover dropped. Watch its claim window, which is shorter and closes.
4. **Check your long-service tier** (chapter 4) and confirm you were paid the additional grant for the days you served.
5. **Appeal if needed.** You have twelve months to appeal a Bituach Leumi decision you believe is wrong.

### The deadlines that matter

![Reserve-pay deadlines at a glance](claim-deadlines.png)

| Item | Window |
|---|---|
| File Bituach Leumi tagmul claim | 12 months from service |
| Appeal a Bituach Leumi decision | 12 months |
| Tax Authority business grant | Per-period window (shorter, closes) |
| Protected money in your account | 30 days after deposit (a protection, not a deadline) |

The pattern across this whole course holds here: the entitlements do not chase you. The base tagmul is the easiest to collect; the business grant and the long-service tiers are where self-employed reservists most often leave money behind. Track your days, file each claim on its own track, and verify the amounts against chapters 2 and 4.

## Companion skills

This course is the map of what reserve duty owes you and how to claim it. These catalog skills handle the tactical, repeatable work: tracking days, keeping the income records, and checking specific benefits.

- **Israeli Miluim Manager** (`israeli-miluim-manager`), for tracking your reserve service days and generating the claim forms that chapters 1, 3, and 6 depend on. Install: `npx skills-il add skills-il/government-services/israeli-miluim-manager`
- **Israeli Bituach Leumi** (`israeli-bituach-leumi`), the reference for National Insurance reserve benefits, family grants, and the claim and appeal process (chapters 4, 5, and 6). Install: `npx skills-il add skills-il/government-services/israeli-bituach-leumi`
- **Israeli Freelancer Operations** (`israeli-freelancer-ops`), for keeping the self-employed income records that drive the tagmul recalculation and the business-grant turnover test (chapters 2 and 3). Install: `npx skills-il add skills-il/tax-and-finance/israeli-freelancer-ops`
