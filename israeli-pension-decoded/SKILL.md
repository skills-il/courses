---
name: israeli-pension-decoded
description: A 6-chapter course on the Israeli pension system for non-experts. Teaches the two-question decision tree (do you need a fund, who inherits), how default funds work, how to read pensianet, and when to switch. Anchored to 2026 numbers.
license: MIT
---

# The Israeli Pension System, Decoded

Most Israelis touch their pension in three moments: when they get their first payslip and see a deduction they did not approve, when a friend says "you are with the wrong fund," and when a relative dies and someone asks who gets the pension. The rest of the time, the pension sits in the background, invisible, and the default decisions made by an employer or the Ministry of Finance compound silently for forty years.

This course is the strategic layer the pension fund's own brochure will never give you. Six chapters. Two anchor questions. Real 2026 numbers. By the end you will know what your pension actually buys you, why you got auto-assigned to one of four default funds, how to read the official comparison portal, and the two and only two reasons to switch funds.

## Course Overview

| Chapter | What you walk away with |
|---|---|
| 1. What pension actually buys you | The three products bundled inside every pension fund, and the 2026 numbers that anchor the whole system |
| 2. The two-question decision tree | A reusable framework: do you need a fund (Q1), who inherits if something happens (Q2) |
| 3. Why you got auto-assigned to a default fund | How auto-allocation works since June 2025, which four funds are designated, and why "default" does not mean "best" |
| 4. How to actually compare funds | A no-jargon walkthrough of פנסיה נט (pensianet) and the six columns that matter |
| 5. Self-employed pension | Mandatory since 2017, with a tax-benefit ladder most freelancers leave on the table |
| 6. When to switch funds, when to stay put | The two real reasons to switch, and four common reasons that do not hold up |

This is education, not investment advice. For binding recommendations on your specific situation (inheritance planning, leaving Israel, switching mid-career), consult a licensed pension advisor (יועץ פנסיוני). The course tells you what the levers are and how to read them. The advisor tells you which lever to pull for you.

For ongoing chat-style questions while you work through this material, the sister skill to this course is `israeli-pension-advisor` at https://agentskills.co.il/skills/israeli-pension-advisor. It answers questions about contribution structure, withdrawal rules, and tax benefits in conversation. It deliberately does not recommend specific funds. That is what this course is for.

## Chapter 1: What pension actually buys you

Every pension fund in Israel is three financial products fused into one container. Most people think they bought a retirement account. They actually bought a retirement account plus disability insurance plus survivor benefits, all priced as a package and all governed by one regulator (רשות שוק ההון, ביטוח וחיסכון, the Capital Markets, Insurance and Savings Authority).

### The three products inside every pension fund

1. **Retirement income (קצבת זקנה in the fund context, distinct from Bituach Leumi's קצבת זקנה).** When you stop working, the fund converts your accumulated savings into a monthly payment using an actuarial conversion factor (מקדם המרה). The factor depends on your age at retirement, life expectancy, and whether you elected a guarantee period for your spouse.

2. **Disability insurance (ביטוח אובדן כושר עבודה).** If you become unable to work, the fund pays a monthly disability allowance. The regulatory cap is 75 percent of your insured salary, but actual coverage in practice is lower: the fund's payment is coordinated (תיאום) with any disability benefit you receive from Bituach Leumi (נכות כללית), so the combined gross payout cannot exceed the 75 percent cap. The premium is bundled by regulation; you cannot opt out, and it comes out of your monthly contribution automatically.

3. **Survivor benefits (קצבת שאירים, pension fund version).** If you die, your eligible survivors receive a monthly pension from the fund, paid for life or until the orphan turns 21. The eligible-survivor list and the rules are set by the Capital Markets Authority, not by your will. We unpack this in Chapter 2.

The cost of disability and survivor coverage is bundled inside the management fee on deposits. You cannot buy a "pension fund without insurance" in the Israeli market; the bundle is the product.

The claim mechanics for the disability product, briefly: if you become unable to work, you (or your family on your behalf) file a claim with the fund. The fund typically requires a medical assessment by their designated reviewers, which can take 60-120 days. Coordination with Bituach Leumi's disability benefit (נכות כללית) is automatic; you do not need to choose between them. If the claim is denied, an internal appeal exists, and a final appeal to the regional labor court (בית הדין האזורי לעבודה) is available.

### Section 14 vs. the traditional severance arrangement

One of the most important employer-side decisions affecting your pension is whether your workplace is on a "Section 14 arrangement" (הסדר לפי סעיף 14 לחוק פיצויי פיטורין). Most modern Israeli workplaces are, but not all, and the difference shapes what happens at termination.

**Traditional arrangement (without Section 14):** the employer's 8.33 percent severance contribution accumulates in a separate sub-account inside your pension fund. When you leave the job (resignation or termination), the employer owes you a severance lump sum equal to one month's salary per year worked, calculated on your LAST salary at the time of separation. The amount already accumulated in the severance sub-account counts toward the obligation; the employer pays the difference (the השלמה) from their own pocket. This makes long-tenured separations expensive for employers.

**Section 14 arrangement:** the employer's 8.33 percent severance contribution is treated as full and final settlement of severance obligations. There is no השלמה owed at separation. What sits in your severance sub-account IS your severance. The trade-off: the amount reflects each year's contribution at the time, not your last salary. For employees whose salary grew substantially over their tenure, Section 14 can leave them with LESS severance than the traditional arrangement would have. For employees with relatively flat salaries, the two arrangements end up close.

How to know which one you are on: check your employment contract for a clause about הסדר לפי סעיף 14, or ask HR. Section 14 is opt-in per employer and once chosen typically applies to all employees of that employer.

### The Israeli pension landscape in 60 seconds

| Product | Hebrew | What it actually is |
|---|---|---|
| Pension fund | קרן פנסיה (mostly comprehensive: מקיפה) | The default for almost every Israeli employee or self-employed person. Bundles retirement + disability + survivors. Governed by the Capital Markets Authority. |
| Manager's insurance | ביטוח מנהלים | A different financial product (life insurance with a savings component). The 2013 reform removed the guaranteed conversion factor (מקדם מובטח) for new policies, which made new ביטוח מנהלים much less attractive than a pension fund for most people. Old policies issued before the reform may carry a guaranteed conversion factor of 6-7 percent versus a current market factor closer to 3-4 percent; if you have such an old policy, that guarantee is extremely valuable and you should consult a licensed advisor before considering any switch. |
| Provident fund | קופת גמל | A tax-advantaged savings account. Does not include disability or survivor coverage. Common as a supplemental layer for self-employed and as the destination for severance pay (פיצויים). |

When this course says "pension fund," it means קרן פנסיה מקיפה (comprehensive pension fund). That is what virtually everyone reading this is in. The skill `israeli-pension-advisor` covers the differences in depth if you want the long version.

### The 2026 numbers that anchor everything

The Israeli pension system is indexed to two numbers republished every January by Bituach Leumi (National Insurance Institute):

| Number | 2026 value | What it gates |
|---|---|---|
| Average wage in the economy, Section 2 (שכר ממוצע לפי סעיף 2) | ₪13,769 per month | Self-employed pension contribution bands, deduction caps, credit caps |
| Average wage, Section 1 (שכר ממוצע לפי סעיף 1) | ₪13,566 per month | Bituach Leumi benefit calculations (kiztavat zikna, dmei avtala, etc.) |
| Pension-eligible salary cap (employees) | ₪50,695 per month | Income above this is not subject to mandatory pension contributions |

You will see these numbers again in every later chapter. They flow through the whole system. The reason a self-employed person earning ₪82,614 pays a different rate than one earning ₪82,615 is because ₪82,614 is exactly half of (12 × ₪13,769) – the half-average-wage threshold.

### The cost of "I will deal with this later"

The most common mistake: deferring the pension conversation for the first two years of your career. Here is what that actually costs.

A salaried employee earning ₪15,000 per month contributes 6 percent (₪900). The employer contributes 6.5 percent for pension plus 8.33 percent for severance, totaling 14.83 percent (₪2,224). Total monthly going into the pension: ₪3,124. Two years of not actively choosing a fund means two years inside whatever fund the employer picked as the workplace default. If that workplace default happens to be one of the four designated default funds covered in Chapter 3, fees are capped at 0.22 percent on accumulation and 1 percent on deposits. If it is NOT one of the four (some employers default to non-tender funds like Menorah, Migdal, or Harel), the fees can be substantially higher. Either way, two years of not checking the 5-year cumulative return your fund delivered is two years of compounding the wrong choice. Chapter 4 fixes that.

The fix for Chapter 1 is simpler: in the next 10 minutes, open your last payslip (תלוש משכורת), find the line that says "קרן פנסיה" or "פנסיה," and write down (a) the name of the fund and (b) the deposit percentage. You now know what you are in. Chapter 2 tells you whether it is the right shape for your life situation.

## Chapter 2: The two-question decision tree

Every pension question worth asking reduces to two: do you need a fund right now, and who inherits if something happens to you tomorrow? Most Israelis answer Q1 correctly (employer enrolls them automatically) and then never think about Q2 again. That asymmetry is the single largest source of preventable financial mistakes in Israeli pension.

### Q1: Do you need a pension fund right now?

Israeli pension is mandatory in three different ways for three different audiences. The decision tree:

- **Salaried employee with prior pension coverage in the last 12 months.** Mandatory from day 1 on the new job. Your employer must deduct your 6 percent and add 6.5 percent + 8.33 percent severance starting with the first payslip.

- **Salaried employee with NO prior pension coverage (first job, or back from a long break).** Mandatory from month 7. The employer must enroll you no later than the seventh full month of employment, retroactive to month 1 of the relevant tax year. If your employer "forgets," they owe you back-contributions plus statutory interest, and the Ministry of Labor enforces it.

- **Self-employed (osek patur or osek murshe).** Mandatory since the 2017 חוק פנסיה חובה לעצמאים (Mandatory Pension for the Self-Employed Law). You enroll yourself directly with a fund. Penalty for non-compliance: roughly ₪500 per year, which is so low that many self-employed people pay the fine and skip the contribution. Chapter 5 explains why that math is wrong (you are leaving thousands of shekels of tax benefit on the table).

- **Student / part-time at one job / contractor invoicing through a personal account.** It depends on your status: if you are W2 (שכיר) at any percentage, you fall under the employee mandate. If you invoice as an עוסק, the self-employed mandate applies. There is no exempt category for "I only work a few hours."

If you are in any of the first three categories and you are not currently contributing, you have a problem to fix this week, not next year.

### Q2: Who inherits if something happens to you tomorrow?

This is where many Israelis make a quiet, expensive mistake. The pension fund's survivor rules are NOT set by your will. They are set by the fund's regulation (תקנון הקרן), and the eligibility definitions of "spouse" and "orphan" are referenced from the Bituach Leumi statutory definitions.

Eligible survivors, in order:

1. **Spouse (אלמן/אלמנה or ידוע/ידועה בציבור).** Common-law partners count, including same-sex partners. A surviving spouse receives the pension fund's survivor pension regardless of their own income. (Note: do not confuse this with Bituach Leumi's separate survivor benefit (קצבת שאירים from ביטוח לאומי), which DOES have an income test. Pension fund survivor pension and Bituach Leumi survivor benefit are two different programs.)

2. **Orphan (יתום).** Any child of the deceased under age 21. They receive a monthly pension until they turn 21. Some funds extend coverage during mandatory military or national service, and exception rules exist for orphans in higher education.

3. **Disabled adult orphan or dependent parent.** Specific eligibility rules, mostly tied to financial dependence on the deceased. A disabled adult orphan (orphan with permanent disability) may receive lifetime survivor pension under separate provisions of the fund's תקנון.

4. **If none of the above exist**: the accumulated savings are paid out as a lump sum to your designated beneficiaries (the form you fill in at the fund). If you never filled in that form, the money goes to your legal heirs via court order (צו ירושה or צו קיום צוואה). The court order process commonly takes months and incurs lawyer/court fees that vary widely depending on contestation and complexity; budget for it before the need arises.

### Two scenarios that play out very differently

**Scenario A: Married, 2 kids, no will, beneficiary form never updated.**
You die. Spouse gets monthly pension for life. Both kids get monthly orphan pension until 21. Smooth, regulated, fast. The "no will" detail does not matter here because survivor pension is regulated, not testamentary.

**Scenario B: Divorced, no children, beneficiary form still names ex-spouse from 8 years ago.**
You die. The fund pays the lump sum to the named beneficiary (your ex). Your current partner (not registered as common-law) gets nothing. Your parents get nothing. This is the most common avoidable mistake in the Israeli pension system, and it is fixed by 5 minutes on your fund's website.

The most common mistake in Q2: never updating the beneficiary form after marriage, divorce, the birth of a child, or the death of a parent. Open your fund's portal this week. Find the form called הסכם מינוי מוטבים or כתב הצהרת מוטבים. Update it.

For more nuanced cases (the spouse income test, common-law without registration, blended families), the `israeli-pension-advisor` skill walks through the specific rules in conversation. The course gives you the framework; the skill answers the specific question.

## Chapter 3: Why you got auto-assigned to a default fund

In June 2025 the Ministry of Finance turned on a rule that quietly affects every new Israeli employee at a company with 50 or more workers: if you do not actively choose a pension fund within 60 days, you get allocated to one of four designated default funds based on the last digit of your Israeli ID number. This chapter explains the mechanism, names the four funds, and answers the question every reader has by now: is the default fund the BEST fund, or just a CONVENIENT one?

### The four default funds, 2021 through 2028

Every three to four years, the Capital Markets Authority runs a tender (מכרז קרנות ברירת מחדל) and selects the funds that will serve as defaults for the next period. The current designation runs from November 1, 2021 through October 31, 2028. The four funds:

| Fund | Hebrew name | Operator type |
|---|---|---|
| Altshuler Shaham Pension | אלטשולר שחם גמל ופנסיה | Investment house |
| Meitav | מיטב בית השקעות | Investment house |
| Mor Gemel ve-Pension | מור קופות גמל | Investment house |
| Infiniti | אינפיניטי ניהול השתלמות וגמל | Investment house |

Notice what is NOT on this list: the large traditional insurance houses (Migdal, Menorah Mivtachim, Harel, Phoenix, Clal). They run pension funds, but they are not part of the current default tender. That is a regulatory decision by the Capital Markets Authority, not a quality judgment.

### Auto-allocation: how you get assigned

Since June 2025, if you join a company with 50+ employees and do not pick a fund within 60 days, you are allocated by your ID check-digit (the last digit of your תעודת זהות):

| Last digit of your ID | Allocated to |
|---|---|
| 0 or 1 | Meitav |
| 2 or 3 | Altshuler Shaham |
| 4, 5, or 6 | Mor |
| 7, 8, or 9 | Infiniti |

If your employer has fewer than 50 employees, the default-allocation rule does not apply automatically. The employer must still enroll you in a pension fund, but they may pick any one of them as the workplace default.

### The regulated fee cap during the default period

In exchange for being designated, the four default funds agree to a regulated fee ceiling that lasts the full default period, applicable to anyone who joins one of these four funds (whether through auto-allocation or by active choice):

> "שיעור דמי הניהול המקסימליים של ארבע קרנות הפנסיה הנבחרות: 0.22% מהצבירה, 1% מההפקדות."

Translation: maximum management fees for the four selected pension funds are 0.22 percent of accumulated savings and 1 percent of new deposits. That is the lowest regulated fee tier in the market. By comparison, the regulatory MAXIMUM for any pension fund is 0.5 percent on accumulation and 6 percent on deposits; in practice, non-default funds with no negotiated discount commonly charge 0.3 to 0.5 percent on accumulation and 1.5 to 4 percent on deposits, with collectively-bargained workplace agreements often securing lower rates. The point is that fees vary widely outside the four designated funds, and grandfathered fee schedules from older contracts may persist even if a fund's current rate card looks competitive.

### So is the default fund the BEST fund?

No. It is the fund with the regulated-cap fees. Fees are one of two axes that determine your 40-year outcome; returns are the other. The default-fund mechanism guarantees the first axis (low fees) but not the second (high returns).

In the 5-year cumulative returns published by the official פנסיה נט portal at the end of 2025, the top three positions in the age-based tracks (the relevant tracks for most Israelis) were taken by Phoenix, Clal, and Meitav. Of those three, only Meitav is a default fund. Phoenix and Clal are not in the current default tender at all.

Meaning: an Israeli who got auto-allocated to Meitav is in a fund with both regulated-cap fees AND a top-3 long-term return record. An Israeli auto-allocated to one of the other three default funds got the fees but not (necessarily) the returns.

The most common mistake in Chapter 3: assuming the default fund's regulated fees compensate for any return difference. They often do (the fee gap can be substantial and compounds over decades), but a meaningfully lower return on the same time window can wipe out the fee advantage. The right way to check is to compare your fund's 5-year cumulative return to the same-track cohort leaders, which is exactly what Chapter 4 walks through.

For Israeli employees who want to verify which fund their employer enrolled them in, and how the auto-allocation rule interacts with mandatory contributions from Bituach Leumi (such as the old-age pension layer קצבת זקנה), the `israeli-bituach-leumi` skill is at https://agentskills.co.il/skills/israeli-bituach-leumi.

## Chapter 4: How to actually compare funds (fees + returns)

This is the chapter where you do the work. The official comparison tool in Israel is פנסיה נט (pensianet.cma.gov.il), run by the Capital Markets Authority. It is the only data source you can trust for fund-level comparisons because every fund is required to report to it. Bloggers, brokers, and YouTube influencers all derive their numbers from פנסיה נט or its sibling סופרמרקר (supermarker, run by The Marker which pulls from pensianet). Go to the source.

### The six columns that actually matter

When you open פנסיה נט and view a fund's profile, there are dozens of fields. Six of them carry 95 percent of the signal:

| Column | What it tells you | Why it matters |
|---|---|---|
| דמי ניהול מהפקדה (deposit fee) | Percent of every new contribution taken by the fund | Charged on every monthly payment for 40 years. A 1 percent gap here compounds dramatically. |
| דמי ניהול מצבירה (accumulation fee) | Percent of your entire savings balance taken annually | The bigger your balance, the more this hurts. A 0.2 percent gap on ₪500,000 is ₪1,000/year. |
| תשואה 12 חודשים | Trailing 12-month return | Noisy. Useful only to spot something catastrophic. Do not switch funds on this number alone. |
| תשואה ממוצעת 3 שנים | 3-year annualized return | Better signal. Smooths most market noise. |
| תשואה ממוצעת 5 שנים | 5-year annualized return | The most reliable single column. Long enough to span a market cycle, short enough to reflect current management. |
| תשואה מצטברת 5 שנים | 5-year cumulative return | Easiest to compare across funds. This is what we use below. |

### Why Israeli pension returns look lower than US 401(k) returns

A common confusion: a US 401(k) with an S&P 500 index allocation might show a 5-year cumulative return north of 80 percent. An Israeli pension fund's general track for the same period shows maybe 35-50 percent. That is not because Israeli fund managers are worse. It is because the Israeli state guarantees a yield floor on a portion of pension assets, which structurally caps equity exposure.

Until October 2022 the mechanism was called אגרות חוב מיועדות (designated bonds): the state issued special bonds that 30 percent of each fund's assets had to hold, paying a regulated yield. In October 2022 a reform (within the late-2021 חוק ההסדרים) replaced that with a new mechanism, מנגנון הבטחת תשואה (yield-guarantee mechanism): for new contributions, the state guarantees a 5.15 percent real annual return on 30 percent of fund assets through a dedicated reserve fund. Older money continues under the designated-bonds rule until those bonds mature. Either way, the practical effect for the saver is the same: 30 percent of your contributions are in a state-backed yield-floor sleeve, which is why your fund's headline equity exposure (and thus its upside in good market years) looks lower than a US 401(k) with a 100 percent equity allocation.

The 2025 single-year top performer in the equity track was Menorah Mivtachim's pension equity track at 21.8 percent for the year. Menorah's pension fund also ranked first in the 5-year cumulative comparison published at end of 2025 (around 81.4 percent cumulative). The equity track (מסלול מניות) is NOT the default for most employees. The default for most employees is the age-appropriate track (50- / 50-60 / 60+), where the regulated state-backed sleeve plus age-targeted equity allocation produces materially more conservative returns.

Past performance does not guarantee future results. The fund names above are mentioned to illustrate how to read the official פנסיה נט rankings; they are not a recommendation to choose any specific fund.

### Worked example: fees over 30 years

Two pension paths, identical contributions (₪3,000/month, growing 2 percent per year), identical 5 percent annual gross return, different fees.

| Path | Deposit fee | Accumulation fee | Approximate ending balance after 30 years |
|---|---|---|---|
| Default fund (regulated cap) | 1.00% | 0.22% | ₪2.30M |
| Typical non-default with no discount | 2.50% | 0.50% | ₪2.03M |

The fee gap costs roughly ₪270,000 over 30 years on a single contributor. Doubled (couple), the gap is over ₪500,000. The fee column matters more than people think. The return column matters more still, but only if you actually check the 5-year cumulative figure rather than picking on last quarter's headline.

### A note on old defined-benefit pensions (קרנות פנסיה ותיקות)

Some Israelis (especially older public-sector employees, or those who started working before 2003) are members of an "old fund" (קרן ותיקה): Mivtachim Vatika, Maccabi Vatika, and similar. These are defined-benefit plans, not the defined-contribution funds covered in this course. The pension benefit is calculated by a formula based on tenure and final salary, not by what you accumulated. If you are a member of one of these funds, the entire framework in this course (fee comparison, fund switching, return tracking) does NOT apply to that portion of your pension. Consult a pension advisor specifically familiar with old funds; the rules are an entirely separate body of regulation, and several of the old funds are in long-term financial restructuring with their own special protections and risks.

### The "switching cost" trap

The marketing for pension switching firms (סוכני פנסיה / חברות סוכנות) emphasizes the savings from moving to a lower-fee fund. They are usually right. But three real costs of switching often go unmentioned:

1. **Insurance underwriting and pre-existing conditions.** Under the תקנון האחיד (standard regulation) for comprehensive pension funds, a direct transfer between two comprehensive funds preserves your original qualifying period (תקופת אכשרה), so pre-existing conditions covered by your current fund typically remain covered after the move. The risk is a BREAK in coverage: any gap (even brief) can reset the underwriting clock, re-exposing chronic illnesses to exclusion or higher pricing. If you have any pre-existing condition, do NOT initiate a transfer without first consulting a licensed pension advisor (יועץ פנסיוני) and getting written confirmation from the new fund about coverage continuity. The cost of consulting an advisor is trivial compared to losing disability or survivor coverage entirely.

2. **Timing of the transfer.** Some funds settle the transfer mid-month, others mid-quarter. A bad timing can mean 4-8 weeks where you have less coverage than you should.

3. **Year-end accounting.** Switching mid-year can complicate your annual tax statement (טופס 161). It is not a deal-breaker, but plan for the bookkeeping.

The most common mistake in Chapter 4: switching funds based on a single year's return number. The fix: always look at the 5-year cumulative column. If the 5-year cumulative gap between your current fund and the cohort leader is less than 5 percent (cumulative, not annualized), do not switch. The friction is not worth it.

For payslip-level verification that your employer is actually depositing the correct contribution amount (you would be surprised how often the deduction line and the actual deposit do not match), the `israeli-payroll-calculator` skill at https://agentskills.co.il/skills/israeli-payroll-calculator is the right cross-check tool.

## Chapter 5: Self-employed pension (mandatory since 2017)

If you are an osek patur or osek murshe, you are required by law to contribute to a pension fund. The law is called חוק פנסיה חובה לעצמאים, in force since January 2017. The penalty for non-compliance is approximately ₪500 per year, which is so low that many self-employed people just pay the fine and skip the contribution. They are leaving an order of magnitude more in tax benefit on the table than the fine costs. This chapter explains why, with the 2026 numbers.

### The 2026 contribution bands

Self-employed pension contributions are calculated on your annual taxable income (הכנסה חייבת), in two bands tied to the average wage (₪13,769/month × 12 = ₪165,228/year):

| Annual income band | Mandatory contribution rate | What it covers |
|---|---|---|
| Income up to ₪82,614 (half of average wage × 12) | 4.45% | The minimum to satisfy the mandate |
| Income from ₪82,615 to ₪165,228 (between half and full average wage) | 12.55% | Mandate on the next slice |
| Income above ₪165,228 | Voluntary (but tax-advantaged) | See tax benefits below |

A self-employed person earning ₪120,000/year falls partly in the low band (4.45% on the first ₪82,614 = ₪3,676) and partly in the high band (12.55% on the next ₪37,386 = ₪4,692), for a total mandatory contribution of approximately ₪8,368/year. Skipping it costs ₪500 in fines. Doing it right unlocks the tax benefit ladder described next.

### The 2026 tax benefit ladder

This is what self-employed people miss when they "just pay the fine." The benefit comes through two parallel channels, both indexed to your annual income up to the ₪232,800 cap.

1. **Deduction channel (ניכוי), up to 11 percent of income, capped at ₪25,608/year.** A self-employed person earning ₪232,800 hits the deduction cap by contributing ₪25,608 (11 percent of income). This portion comes off your taxable income; at a 35 percent marginal rate it is worth roughly ₪8,963 in tax saved.

2. **Credit channel (זיכוי), an additional 5.5 percent of income, capped at ₪12,804/year, earning a 35 percent credit.** On top of the deduction, you can contribute another 5.5 percent of income (up to ₪12,804 at the cap), and the tax authority returns 35 percent of that contribution as a credit, regardless of your marginal rate. At the cap that credit is roughly ₪4,481.

3. **Combined tax-advantaged cap: 16.5 percent of income, up to ₪38,412/year.** The two channels apply to two stacked slices of the SAME annual income (the first 11 percent and the next 5.5 percent). They do not double-up on the same money. At the ₪232,800 income cap, the maximum tax-advantaged contribution is ₪25,608 + ₪12,804 = ₪38,412 per year, and the combined tax savings are approximately ₪13,400 (₪8,963 + ₪4,481).

For incomes below ₪232,800, the caps scale down proportionally: a self-employed person earning ₪120,000 can deduct up to 11 percent (₪13,200) and contribute another 5.5 percent (₪6,600) into the credit channel, total ₪19,800 tax-advantaged.

The fine for non-compliance is ₪500. The forgone tax benefit can be ₪10,000+. The math does not require a calculator.

### Worked example: ₪200k/year freelancer

A freelancer with ₪200,000 in taxable income in 2026. The numbers below are approximations to illustrate the structure; your accountant should compute your exact figures, since the deduction and credit channels can interact with other deductions on your return.

| Strategy | Contribution | Pension savings accrued | Approximate net tax effect |
|---|---|---|---|
| Pay the fine, contribute nothing | ₪0 | ₪0 | ₪0, plus a ₪500 fine |
| Mandatory minimum only | About ₪18,400 (4.45% on first band + 12.55% on the next ₪117,386) | About ₪18,400 in fund | Roughly ₪6,400 reduction in tax owed |
| Optimized for full tax channels | Up to ₪33,000 (16.5% of ₪200,000 income) | About ₪33,000 in fund | Roughly ₪11,500 reduction in tax owed |

The third path requires the freelancer to put roughly ₪14,600 of additional cash into the pension fund (beyond the mandatory minimum). In exchange, the fund balance grows by ₪14,600 of locked-in retirement savings AND the additional tax reduction is roughly ₪5,100 vs the minimum-only path. This is tax efficiency, not investment return: the additional ₪14,600 is your own money, locked in the fund until age 60+, subject to fees and market risk. Treat it as "I am moving money I would have paid in tax into a long-term savings account that holds it for me" rather than as a return on capital.

### Pairing strategy: keren pensia + keren hishtalmut

The full self-employed tax stack is not just the pension fund. The next layer is קרן השתלמות (training fund), a separate provident-fund product with its own deduction cap (covered in detail by the `israeli-pension-advisor` skill and by the `israeli-freelancer-year` course's chapter 4). The combined annual ceiling across pension + keren hishtalmut is substantial for a high-earning self-employed person; most freelancers structure their year around hitting both ceilings rather than just the pension cap. Your accountant should run your specific numbers.

The most common mistake in Chapter 5: paying the fine to skip the mandate. The fix: open your annual tax planning conversation with your accountant by asking "how do I max out the pension + keren hishtalmut tax stack this year?" and adjust monthly cash flow to hit it.

For ongoing detailed questions about which contribution channel fits which scenario (and especially for the keren hishtalmut layer), the `israeli-pension-advisor` skill is the right tool. The course gets you to the planning conversation; the skill walks you through the line-item math.

## Chapter 6: When to switch funds, and when to stay put

You have a fund. You know how to compare it to alternatives. The remaining question is the practical one: should you switch, and if so, when? The marketing pressure from switching firms (סוכני פנסיה) is constant, and most of it is wrong. Two reasons to switch hold up under scrutiny. Four common reasons do not.

### The two switch reasons that hold up

1. **Your current fund's fees exceed the default-fund cap by a meaningful margin.** If you are paying more than 1 percent on deposits or more than 0.22 percent on accumulation, and your fund is not delivering a 5-year cumulative return that beats the default cohort by at least 5 percentage points, the fee gap is taking money from you with no offsetting benefit. Switch.

2. **Your 5-year cumulative return is more than 5 percentage points below the cohort leader in the same track.** Funds report by track (general, equity, age-based 50- / 50-60 / 60+). Compare apples to apples. If your fund is more than 5 cumulative pp behind the same-track leader over 5 years and you have ruled out a structural reason (different equity exposure, different fee structure), management quality is meaningfully different and switching is warranted.

### The four switch reasons that do NOT hold up

1. **One bad quarter or one bad year.** Markets cycle. A single 12-month underperformance is statistical noise, not signal. Wait for the 5-year cumulative number to confirm.

2. **A friend, coworker, or family member said your fund is bad.** They usually mean "their" fund is better, which is not a comparison. Ask them for the 5-year cumulative number for your fund AND theirs in the same track. They will not have it.

3. **Your employer pressures you to move to a different fund.** Employers in Israel cannot legally force a fund choice (since the 2008 פנסיה חובה extension order). They can have a "workplace default," but you may opt for any approved fund. If pressure persists, the Ministry of Labor (משרד העבודה) takes complaints.

4. **A pension agent (סוכן פנסיה) cold-called you with a "limited-time offer" on management fees.** Every fund will negotiate fees with a credible threat to switch. Get the offer in writing, then call your current fund and ask if they will match. They usually will.

### The "leave it to my adult kids" mistake

A common misconception, especially among Israelis without minor children or a spouse: "my pension will go to my adult kids as inheritance when I die." That is not how the survivor mechanism works.

If you die before retirement and have no eligible survivors (no spouse, no minor children, no disabled adult orphan, no dependent parent), your accumulated savings convert into a lump sum, NOT into a monthly survivor pension. The lump sum goes to your designated beneficiaries (the form mentioned in Chapter 2). If you never designated beneficiaries, it goes to your legal heirs via court order (צו ירושה or צו קיום צוואה), which incurs court and lawyer fees that vary widely (from minimal for a self-filed uncontested case to substantially higher if anyone contests) and typically takes months to complete.

Adult kids will eventually receive the lump sum if you name them. They will NOT receive a monthly survivor pension because adult children are not in the eligible-survivor list. The fund is a retirement and disability-and-survivor product, not an estate-planning vehicle. If you want to leave assets to adult children efficiently, do it through a separate kupat gemel (provident fund), a savings policy (פוליסת חיסכון), or non-pension financial assets where the inheritance mechanism is simpler.

### What happens at a job change

A job change is the most common moment Israelis revisit their pension. Three things move (or do not move) automatically:

1. **Your fund follows you, automatically.** Your pension fund account is yours, not your employer's. When you switch jobs, your new employer continues contributions to the SAME fund unless you actively request a transfer to a different one. Your accumulated balance does not reset.
2. **Severance handling depends on Section 14** (see Chapter 1 if you skipped it). On a Section 14 employer, what is already in your severance sub-account is yours, period. On a non-Section 14 employer, you may negotiate a severance settlement at the time of separation, which can land in the severance sub-account or as a separate payment.
3. **Disability and survivor coverage continues** as long as contributions continue. A gap in employment (e.g., two months between jobs) is the risky moment: brief gaps usually do not break coverage, but extended ones can re-open the underwriting clock under your fund's תקנון. If you expect a gap longer than a few weeks, ask your fund about a "risk-only continuation" (המשך ביטוח) so you stay covered without making full contributions.

The decision point at a job change: should you take the opportunity to switch funds (since you are revisiting the topic anyway)? Apply the framework above: only switch if you are paying more than the default-fund fee cap AND your 5-year cumulative return is meaningfully below the cohort. A job change is a convenient moment to switch; it is not a reason to switch by itself.

### What actually happens at retirement

The course has focused on the pre-retirement period: choosing, contributing, monitoring. The retirement event itself has its own mechanics worth understanding before you reach it.

The eligible retirement age is 67 for men and 62-65 for women (rising on a published schedule toward 65 for women born after specific cutoff years). At eligible age, you have three choices:

1. **Convert to a monthly pension (קצבה).** Your accumulated savings are converted using the actuarial conversion factor (מקדם המרה). If your savings are ₪1,500,000 and your factor is 220, your monthly pension is roughly ₪6,818 (₪1,500,000 / 220). The factor depends on your age at retirement, life expectancy at that age, and whether you elect a guarantee period for your spouse.
2. **Lump-sum withdrawal (היוון קצבה).** A portion of the accumulated balance can be withdrawn as a lump sum. The exact percentage and tax treatment depend on the date you started contributing, the size of your retirement balance versus the קצבה מזערית (minimum pension floor), and your other pension assets. The lump sum is taxed under its own schedule, which differs from the monthly-pension taxation.
3. **Combination.** Take part as a lump sum and convert the rest to a monthly pension. Most retirees do some version of this.

The monthly pension is taxed as ordinary income, with the elderly tax credit (זיכוי גיל) applied. The lump sum has a separate taxation track that takes into account your tenure and the period over which contributions accumulated.

Two timing decisions that materially affect the outcome:

- **Defer retirement past the eligible age.** The conversion factor improves (you have fewer expected years of payout), so your monthly pension is larger per shekel saved. Common move for those who can keep working and want to maximize income later.
- **Re-think the track in the last 5 years.** Some funds glide your allocation to more conservative tracks automatically as retirement nears. Some retirees benefit from staying in a higher-equity track longer; others prefer the conservative glide. This is the textbook conversation to have with a licensed יועץ פנסיוני before age 60, not at age 67.

### When to consult a licensed pension advisor (יועץ פנסיוני)

This course covers the strategic framework. There are five situations where the framework is not enough and you should pay for one or two hours of a licensed יועץ פנסיוני's time:

1. You are leaving Israel for more than three years (relocation, retirement abroad, or extended sabbatical). The interaction with אזרח חוזר / תושב חוזר rules and the question of redeeming versus freezing your fund is complex.

2. You are considering switching mid-career and you have a pre-existing medical condition that might re-open in underwriting.

3. You have a blended family (children from multiple marriages) and want to structure beneficiary designations to protect specific dependents.

4. You are within 5 years of retirement and need to model the conversion factor (מקדם המרה) under different scenarios (lump sum vs. monthly pension, with vs. without spouse guarantee period).

5. You are self-employed with income variance higher than 30 percent year-over-year and need to plan the tax-stack contribution timing.

For situations 1-4, ask the advisor to provide their license number (license type: יועץ פנסיוני, regulated by the Capital Markets Authority). For situation 5, an accountant (רואה חשבון) is usually the right starting point, with a pension advisor as a second opinion if the numbers are large.

### Closing note

This course is education, not investment advice. The frameworks teach you how to think about your pension; they do not tell you which specific fund or track to choose. The 2026 numbers in this course (average wage, contribution rates, fee caps, tax benefit ceilings) are accurate as of publication and will be updated each January when Bituach Leumi republishes the average wage. For the recurring conversation as your situation changes (new job, kids, divorce, leaving Israel), come back to `israeli-pension-advisor` at https://agentskills.co.il/skills/israeli-pension-advisor and chat with it. The course is what you read once; the skill is what you query repeatedly.

For the government-side layer of your retirement income (Bituach Leumi's קצבת זקנה, eligibility ages, kollel impacts, foreign-residence rules), `israeli-bituach-leumi` is at https://agentskills.co.il/skills/israeli-bituach-leumi. For verifying your monthly payslip deductions match what the fund actually received, `israeli-payroll-calculator` is at https://agentskills.co.il/skills/israeli-payroll-calculator. Each tool answers a different question; together they cover the full ground.

## Companion skills

The course covers the strategy. These skills do the mechanical work of calculation and verification. Install them in your AI assistant and revisit them whenever your situation changes (new job, kids, divorce, leaving Israel).

- **Israeli Pension Advisor** (`israeli-pension-advisor`), optimal keren hishtalmut and pension contribution amounts, plus Tikun 190 and form 161 handling. Install: `npx skills-il add skills-il/tax-and-finance/israeli-pension-advisor`
- **Israeli Bituach Leumi** (`israeli-bituach-leumi`), the government layer: old-age pension, eligibility ages, and returning-resident rules. Install: `npx skills-il add skills-il/government-services/israeli-bituach-leumi`
- **Israeli Payroll Calculator** (`israeli-payroll-calculator`), verifying that monthly payslip deductions match what the fund actually received. Install: `npx skills-il add skills-il/accounting/israeli-payroll-calculator`
- **The Israeli Freelancer Year** (`israeli-freelancer-year`), a companion course for the self-employed who need to time keren hishtalmut contributions alongside their mkdamot strategy. Install: `npx skills-il add skills-il/courses/israeli-freelancer-year`
