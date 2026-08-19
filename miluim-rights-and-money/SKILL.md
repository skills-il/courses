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

Read the chapters in order on the first pass. The first chapter explains the pay mechanism and which track you are on, which everything else builds on. Chapter 3 is the one self-employed readers should not skip: it is the track that does not pay out unless you pursue it.

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

### The 40% supplement, and the mistake almost everyone makes

Before the self-employed calculation, there is a component that is easy to miss and that changes the final figure: Bituach Leumi adds a 40% supplement, but **not on every day**. Divide your service days by 7, and only the **remainder** earns the supplement: a remainder of 0 earns nothing, 1 earns 0.4 of a day, 2 earns 0.8, 3 earns 1.2, 4 earns 1.6, 5 earns 2.0, and 6 earns a full day.

In practice that means 20 days of service is paid as 21, while 21 days of service is paid as exactly 21, with no supplement at all. If you multiplied every day by 1.4 and got a large number, you have probably overstated the tagmul by 40%. This is the single most common cause of a needless argument with Bituach Leumi.

### The self-employed calculation

![Self-employed tagmul: prior installments divided by ninety, plus a supplement](self-employed-formula.png)

For an employee, the daily tagmul is based on the prior three months of salary. For the self-employed, it is based on your reported income (the basis on which you paid advance National Insurance contributions, mkdamot, before your service), prorated to a daily figure. As a rule of thumb that is roughly your reported installments for the three months before service divided by 90, but Bituach Leumi derives the exact daily base from your assessment, so their figure may not literally match your last three mkdamot receipts. Two things make the self-employed calculation special:

- **A 25% supplement.** The self-employed receive an additional 25% on top of the base calculation, applied within the cap and floor above (when the ceiling binds, the supplement does not push you past it).
- **A war-period favorable rule.** Your tagmul is computed on the higher of your reported installments or your final annual tax assessment, and recalculated after the assessment is finalized. If your reported installments understated your real income, the later assessment can increase what you are owed.

The most common self-employed mistake is treating the first payment as final. It is provisional. When your annual assessment is filed, revisit your tagmul: the recalculation can owe you more. The `israeli-freelancer-ops` skill helps you keep the income records that drive this recalculation.

## Chapter 3: The Self-Employed Business Grant, Decoded

This is the chapter to not skip. Beyond the per-day tagmul covered earlier, a self-employed reservist whose business lost income because of reserve service can claim a separate grant, and most do not, because it lives at a different agency and does not arrive on its own.

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
- **Filing:** online through the Tax Authority, with a defined claim window per service period. The windows open on staggered dates but nearly all close together: every eligibility period from November-December 2024 onward closes on **31 December 2026**. Only the 2024 periods expire sooner, and the earliest have already closed. So there is a real deadline, but not the near-term scramble the phrase "rolling window" suggests. Check the current table on the Tax Authority service page before relying on any date.

The lesson of this chapter is structural: the per-day tagmul and the business grant are two separate claims at two separate agencies. Collecting one does not collect the other. The `israeli-miluim-manager` skill helps you track the Order 8 days that determine your eligibility here.

## Chapter 4: Long-Service Grants and Extras

On top of the daily tagmul, reservists who serve longer stretches earn a ladder of additional grants. These are real money that scales with days served, and like everything else in this system, you should verify you received the tier you earned.

### The additional-grant ladder

![The additional-grant ladder by reserve days served](long-service-staircase.png)

The additional reserve grant (tagmul nosaf) goes to anyone who served 10 or more cumulative shamap days in a calendar year, tiered by days. These are the tiers for 2025 service, paid in May 2026:

| Days served (in the year) | Additional grant |
|---|---|
| 10 to 14.5 days | 1,452 NIS |
| 15 to 19.5 days | 2,904 NIS |
| 20 to 36.5 days | 4,356 NIS |
| 37 or more days | 5,808 NIS |

Two things worth knowing about the additional grant: it carries a special 25% tax withheld at source, and it confers **no** tax credit points even though the amounts are calculated as multiples of the credit-point value. Do not count it twice against the combat tax credit.

**The special grant (tagmul meyuchad) has two layers, and this is where money is most easily lost.** Days 32 to 60 pay a flat 133.33 NIS per shamap day. Beyond day 60 the rate is no longer flat, and it is set by the **year the service was performed**: tzav 8 service in 2024 paid 133 NIS per day, tzav 8 service in 2025 paid 133 for the combat array, 60 for HAGMAR and 40 for other units, and service in 2026 (under any order type) is banded by the unit's activity tier, from 133 NIS at tier alef-plus down to 30 NIS at tier heh.

What that means in practice: someone finishing 70 shamap days earns both the days 32 to 60 (29 days times 133.33, or 3,866.57 NIS) and the applicable rate on days 61 to 70. Anyone reading only the day-61 rule misses the first amount entirely. To find your unit's tier, call the reserve hotline at 1111, extension 4, then 1.

These figures are re-set annually in army orders, which is why the law itself obliges the IDF to publish them on the reserve portal. Check there before relying on a number.

### Family support

Reservists serving long stretches (around 40 days or more) may receive an enlarged family grant for a child up to age 14. In 2026 it is paid as a DAILY amount from day 41, banded by the unit's activity tier rather than as a flat per-child sum, so any single figure quoted without a tier is almost certainly the top-tier value. The exact amounts and eligibility windows have changed across the war period, so treat the family-grant figures as indicative and confirm the current rule. The `israeli-bituach-leumi` skill is the reference for which National Insurance grants you and your family currently qualify for.

## Chapter 5: Job and Business Protection

Compensation is only half the picture. The law also protects your job and your standing while you serve, and reservists who do not know these protections sometimes accept treatment they could have refused.

### You cannot be fired for serving

![Job protection for reservists under the Discharged Soldiers Law](job-protection.png)

The Discharged Soldiers (Return to Work) Law of 1949 (חוק חיילים משוחררים (החזרה לעבודה), תש"ט-1949) bars an employer from dismissing an employee because of reserve service. An employer who wants to dismiss a reservist during or around their service must go through an employment committee (va'adat ta'asuka) and obtain a permit; they cannot simply fire you.

The protection comes in two layers, each with a different committee, and that distinction matters most precisely when you have been dismissed:

- **The first 30 days after service** sit in the statute itself (section 41A(b)). During that window you cannot be dismissed, and your job scope and income cannot be cut either, except with a permit from the **Employment Committee** at the Ministry of Defence. Those 30 days are also excluded from the count of prior-notice days.
- **Days 31 to 60** come from an entirely different instrument, a collective-agreement extension order rather than the statute (ילקוט הפרסומים 14498, 29 April 2026), and apply to someone who served 60 or more days in the calendar year including at least 7 consecutive days. Here the permit can only come from a **Supervision Committee** at the Ministry of Labour, which decides within 14 days.

Two details in that order are easy to miss and both can decide your case. The extra 30 days apply **only from 29 April 2026 onward**, so a dismissal earlier in 2026 is not covered by it even though the order otherwise runs from 1 January. And the 60 days are not counted on the calendar year alone: days from the previous year count too if your service ran continuously into the year, with breaks of up to five days still treated as continuous. If you are close to 60 days, check that second rule before concluding you fall short.

This is not a technicality: applying to the wrong committee wastes the window in which you can act. There is also a separate, permanent ban, with no day window at all, on dismissing you **because of** reserve service; such a dismissal is void.

**And if you were dismissed, the state may fund your lawyer.** Reservists dismissed, summoned to a hearing (shimua), or pushed onto unpaid leave because of their service can request representation by an employment-law attorney funded by the Ministry of Defence. It covers employees only, and carries an undertaking to repay the cost if the harm turns out not to have been caused by the service. Do not assume paying out of pocket is your only option.

### The self-employed angle

The job-protection law is written for employees, so the self-employed do not get "no-firing" protection. Their protection is financial: the Tax Authority grant exists precisely because a self-employed reservist has no employer to keep their income flowing. If you are self-employed, your "job protection" is making sure you actually claim that grant.

For employees navigating a dismissal or a dispute tied to reserve service, the `israeli-miluim-manager` skill sets out both layers of protection, both committees, and the state-funded representation route.

## Chapter 6: Claiming What You Are Owed

You now know what exists. This chapter is the order of operations to collect it, and the deadlines that decide whether you can.

### The claim path

![The reserve-pay claim path and deadlines](claim-timeline.png)

The mechanical steps for a self-employed or multi-employer reservist:

1. **Confirm your service days** in your IDF reserve personal area. This is the record everything else is built on.
2. **Generate and file the Bituach Leumi claim** (the reserve-compensation form produced from your personal area) for your per-day tagmul. You have twelve months from the service date.
3. **File the Tax Authority business grant separately** if you meet the Order 8 day threshold and your turnover dropped. Its window is per service period; most periods close on 31 December 2026, and the 2024 ones sooner.
4. **Check your long-service tier** and confirm you were paid the additional grant for the days you served.
5. **Appeal if needed.** You have twelve months to appeal a Bituach Leumi decision you believe is wrong.

### The deadlines that matter

![Reserve-pay deadlines at a glance](claim-deadlines.png)

| Item | Window |
|---|---|
| File Bituach Leumi tagmul claim | 12 months from service |
| Appeal a Bituach Leumi decision | 12 months |
| Tax Authority business grant | Per service period. Most close 31 December 2026; 2024 periods sooner |
| Protected money in your account | 30 days after deposit (a protection, not a deadline) |

The pattern across this whole course holds here: the entitlements do not chase you. The base tagmul is the easiest to collect; the business grant and the long-service tiers are where self-employed reservists most often leave money behind. Track your days, file each claim on its own track, and verify the amounts against chapters 2 and 4.

## Companion skills

This course is the map of what reserve duty owes you and how to claim it. These catalog skills handle the tactical, repeatable work: tracking days, keeping the income records, and checking specific benefits.

- **Israeli Miluim Manager** (`israeli-miluim-manager`), for tracking your reserve service days and generating the claim forms that chapters 1, 3, and 6 depend on. Install: `npx skills-il add skills-il/government-services/israeli-miluim-manager`
- **Israeli Bituach Leumi** (`israeli-bituach-leumi`), the reference for National Insurance reserve benefits, family grants, and the claim and appeal process (chapters 4, 5, and 6). Install: `npx skills-il add skills-il/government-services/israeli-bituach-leumi`
- **Israeli Freelancer Operations** (`israeli-freelancer-ops`), for keeping the self-employed income records that drive the tagmul recalculation and the business-grant turnover test (chapters 2 and 3). Install: `npx skills-il add skills-il/tax-and-finance/israeli-freelancer-ops`
