---
name: ai-agents-for-everyone
description: A 6-chapter non-technical course on AI agents for Israeli professionals and small business owners. Teaches the difference between a chatbot and an agent, how to set one up on Claude Projects / ChatGPT GPTs / Gemini Gems without writing code, prompt patterns that actually work, and four worked Israeli use cases (accountant, lawyer, marketer, small business). No coding required.
license: MIT
---

# AI Agents for Everyone

The conversation about AI in Israel right now is loud and confusing. Half the headlines say AI will replace your job; the other half say it can barely write a coherent email. Neither is true, and neither is useful if you actually want to use this technology to get work done. This course is for the millions of Israelis who are not developers, who have a job to do, who hear "AI agents" thrown around constantly, and who want a clear answer to a small set of questions: what is an AI agent, when should I use one, how do I set one up without writing code, and how do I avoid the obvious traps.

Six chapters. Four real worked Israeli use cases (a freelance accountant, a solo lawyer, a marketing manager, a small business owner). Honest about what AI can and cannot do. By the end, you will have a working agent doing real work for you, and a clear sense of when to push the agent further versus when to call a human professional.

## Course Overview

| Chapter | What you walk away with |
|---|---|
| 1. What is an AI agent (in plain language) | The difference between a chatbot and an agent, with concrete Israeli examples |
| 2. The three platforms (plus Claude Desktop for local files) | Claude Projects, ChatGPT GPTs, Gemini Gems, and a separate note on Claude Desktop + filesystem MCP for "read this whole folder" workflows. File uploads and team sharing covered too. |
| 3. Prompt patterns that turn a chat into an agent | Four reusable patterns that move you from "asking questions" to "getting work done" |
| 4. Real Israeli use cases worked end-to-end | Four scenarios: accountant, lawyer, marketer, small business owner |
| 5. When AI agents fail (and what to do) | Six failure modes including a privacy/data-handling one, a verify-before-trust protocol, and when to call a human |
| 6. Graduating to no-code automation | When chat hits its limit, and how to step up to n8n / Make.com / Zapier |

Important framing before you start: nothing in this course is professional advice. AI agents are research tools and draft generators; they are not a licensed accountant, lawyer, doctor, or financial advisor. The course teaches you how to make AI agents productive. It does NOT teach you when their output is safe to act on without human review. That judgment is yours.

## Chapter 1: What is an AI agent (in plain language)

The simplest way to understand the difference between a chatbot and an AI agent is to compare what each one does for the same request.

You open ChatGPT and type: "I need to draft a contract for a new freelance client. Where do I start?"

A chatbot replies with a paragraph of general advice. Read carefully, restate the scope, define payment terms, etc. It is correct, generic, and only marginally useful. You still have to do all the actual work.

An agent set up for the same purpose does something fundamentally different. It asks you four questions: who is the client, what is the scope, what is the rate, what is the payment term. It uses your answers to produce a complete first-draft service contract, formatted as a real Word document, with the right freelancer-contract clauses (VAT 18% invoicing terms, payment timeline, IP ownership, indemnity, termination notice). It also gives you a list of things you should verify with a lawyer before signing.

The chatbot answers a question. The agent does a task. That is the entire distinction.

### Three real Israeli examples (so the difference is concrete)

![Chatbot vs agent: one question vs multi-step task](chatbot-vs-agent.png)

**Freelance accountant preparing monthly VAT report.** Chatbot: explains what VAT is. Agent: walks through the freelancer's monthly invoices, organizes them by the categorization the freelancer provided (VAT-charged, zero-rated, or exempt), helps double-check the totals, and flags anything that looks unusual for review before submission. (Note: chat-based agents are unreliable at arithmetic over long invoice lists; treat the totals as a draft to verify, not a final number.)

**Solo lawyer drafting a service agreement.** Chatbot: lists the clauses a service agreement typically contains. Agent: asks about the parties, the scope, the term, the governing law, and produces a complete first draft in both Hebrew and English with the standard Israeli clauses (jurisdiction, dispute resolution, IP ownership, termination), ready for the lawyer to edit.

**Marketing manager researching Israeli competitors.** Chatbot: lists generic competitor-research methods. Agent: takes the manager's product category, identifies the 5 main Israeli competitors, summarizes each one's positioning and pricing, lists their recent product launches, and produces a one-page strategic memo with three concrete recommendations.

In every case, the agent does work the chatbot only describes. That is what you are setting up.

### The "stop typing into a chat box" moment

If you find yourself repeatedly typing similar long prompts into a chatbot ("Please summarize this email in Hebrew, formal tone, three bullet points, with a suggested reply..."), you are doing the agent's job for it. The whole point of an agent is to encode that long prompt ONCE, then use it many times by just dropping in the new email each time. Chapter 2 shows you how to do that on the three main platforms.

The most common mistake in Chapter 1: trying to make a chatbot do everything in one mega-prompt. Symptom: your prompts are 400 words long and you copy-paste them every time. Fix: that mega-prompt should be an agent's setup, not a daily message. Move it to a Claude Project, a ChatGPT GPT, or a Gemini Gem once. Use the agent for the daily work.

If you want a daily-reference companion for Israeli business context (work week, holidays, formal Hebrew email norms), install `israeli-personal-assistant` (`npx skills-il add localization/israeli-personal-assistant`). It pairs naturally with anything you build using this course.

## Chapter 2: The three platforms for non-developers

You have three serious options for setting up an agent without writing code: Claude Projects (Anthropic), ChatGPT GPTs (OpenAI), and Gemini Gems (Google). Each one lets you save a prompt and a set of instructions once, then re-use them in a clean conversation each time. The differences matter for Israeli users and they matter for which kind of task you are doing.

![Three platforms: Claude Projects, ChatGPT GPTs, Gemini Gems](three-platforms.png)

### Claude Projects (Anthropic)

A Claude Project is a saved workspace with custom instructions and (optionally) reference documents. You write the instructions once, attach any reference files (a sample contract, your company style guide, a list of your products), and from then on every conversation inside that project starts with all of that context already loaded.

Best for: long-form thinking, careful writing, anything where you want the AI to deeply read and reason over your reference documents. Claude's writing in both Hebrew and English is consistently the most natural of the three. Hebrew handling is strong.

Setup steps:
1. Go to claude.ai, sign in
2. Click the "Projects" tab in the left sidebar
3. "New Project", give it a name (e.g., "Contract drafter")
4. Add "Project instructions" (your encoded mega-prompt: role, task, constraints, format)
5. Upload reference files if you have any (PDFs, Word docs, spreadsheets)
6. Start a new conversation inside the project; the instructions and files load automatically

Free tier: usable for short sessions. Claude Pro: around $20/month, expanded use and access to the best Claude models. Heavy users (long documents, many daily conversations) may hit Pro limits and upgrade to Claude Max ($100-200/month). Project availability on the free tier has changed over time; check claude.ai before assuming free-tier Projects work.

### ChatGPT GPTs (OpenAI)

A GPT is a saved custom version of ChatGPT with its own instructions, knowledge files, and (for advanced users) custom actions that call external APIs. The GPT Store has thousands of pre-built GPTs you can use as starting points.

Best for: structured templates, scenarios where you want a clear input/output workflow, and use cases where someone else's pre-built GPT already does most of what you need.

Setup steps:
1. Go to chatgpt.com, sign in
2. Click "Explore GPTs" then "Create" in the top right
3. Use the GPT Builder (you describe what you want; it generates the configuration) or "Configure" for direct editing
4. Add the instructions, knowledge files, and conversation starters
5. Save as private (just you) or unlisted (share via link)

Free-tier users can create and use GPTs with usage limits. ChatGPT Plus (around $20/month) expands the limits and unlocks the most capable GPT-4-class models. Start free; upgrade only when you hit a limit that actually blocks you.

### Gemini Gems (Google)

A Gem is Google's equivalent of a saved custom AI assistant. The main differentiator: integration with Google Workspace (Gmail, Docs, Drive, Calendar). If your work happens in Google's ecosystem, Gems can read from your Drive and reference your Gmail and Calendar more fluidly than the other two platforms. (For write actions like "send this email" or "create this calendar event", you typically still need to approve each action manually; Gems do not silently send mail.)

Best for: workflows that involve your Google docs, your Gmail, your Calendar. Excellent for small business owners running on Google Workspace.

Setup steps:
1. Go to gemini.google.com, sign in with your Google account
2. Click the "Gems" section in the sidebar
3. "Create new Gem"
4. Give it a name, write the instructions, optionally tie it to specific Google Drive folders
5. Save and use

Free tier includes basic Gem usage. The paid tier (currently branded Google AI Pro, around ₪97.90/month in Israel as of 2026, with a higher Google AI Ultra tier above) unlocks the more capable models and higher usage limits. Google rebrands this product periodically; check gemini.google.com for current naming and pricing before subscribing.

### Claude Desktop: the local-files unlock

All three platforms above run in a browser. Claude has a fourth surface worth knowing about separately: **Claude Desktop**, a native Mac/Windows app that can read files from your computer through something called MCP (Model Context Protocol) servers. For non-developers in Israel, this is the most underrated feature in the whole AI space, because it is the only way to say "read every PDF invoice in my Downloads folder" or "summarize all the Word contracts in my Clients directory" without uploading files one at a time.

What you can do once Claude Desktop + the filesystem MCP server is set up:
- An accountant can point Claude at the folder of monthly scanned invoices and ask "list everything that looks like a software subscription"
- A lawyer can ask "in the past-contracts folder, find every contract that has a non-compete clause, list each one's term length"
- A small business owner can ask "open the Excel file on my desktop named 'inventory', tell me what is below reorder level"

Setup is a few clicks, not code:
1. Download Claude Desktop from claude.ai (the desktop link is at the bottom of the home page)
2. Sign in with the same Claude account you use on the web
3. Open Settings → Connectors → install the official "Filesystem" connector
4. Approve the macOS / Windows folder-access prompt when it appears (you choose which folders Claude can read)
5. Start a conversation and ask Claude to read a file from one of the approved folders

ChatGPT and Gemini have desktop apps too, but their local-file access is more limited (single file at a time, or screen-reading rather than folder-reading). For the "read my whole folder of business documents" use case, Claude Desktop is the practical answer in 2026.

**Two important caveats:**
- The Filesystem connector gives the agent the same permissions you have on the files. Treat any folder you approve as something you are comfortable having an AI read. Do NOT approve folders containing passwords, private keys, or unrelated personal data.
- This is read-mostly today. Write actions (creating or modifying files) on the filesystem are gated by additional permission prompts; do not assume they happen silently.

### Hebrew handling, briefly

All three platforms support Hebrew. The practical differences:

- **Claude**: writes the most natural Hebrew of the three, especially for long-form content. Best for anything where the Hebrew quality really matters (legal drafts, marketing copy, public-facing emails).
- **ChatGPT**: solid Hebrew, occasional awkward phrasing on complex sentences. Best for structured outputs and templates where occasional phrasing tweaks are acceptable.
- **Gemini**: improving fast. Best when you need Hebrew + tight Google Workspace integration.

If your task is "write a beautiful Hebrew thank-you letter," Claude. If it is "extract structured data from this Hebrew email and put it in my spreadsheet," any of the three. If it is "draft a Hebrew email replying to this one in my Gmail," Gemini.

### File and image upload (universal across all three)

All three platforms accept drag-and-drop of PDFs, Word documents, Excel files, and images including photographs and scans. This matters more than the chat interface suggests:

- **Scanned Hebrew documents** (a contract you received as a PDF, an invoice you photographed with your phone, a receipt): drag it in, ask "summarize this in Hebrew" or "extract the line items as a table". OCR quality on Hebrew is solid on all three; Claude tends to be the cleanest on handwriting.
- **Excel and Google Sheets exports**: drag in an XLSX or CSV, ask the agent to analyze. This pairs well with the Code Interpreter / spreadsheet handling note in Chapter 4.
- **Screenshots**: take a screenshot of any UI, drag it in, ask "what does this dialog mean?" or "what should I click here?". Useful when stuck in a government portal you have not seen before.

A practical rule: if the source is on your screen or in a folder, upload it instead of retyping. Modern agents read documents far better than they remember what you described.

### Sharing your agent with a team

Once your agent is doing useful work, the next question is whether your assistant, your partner, or your employee should use the same one.

- **Claude Projects**: shareable with other Claude users on the same plan (Pro/Team). For a small office on Claude Team, anyone in the workspace can access shared Projects.
- **ChatGPT GPTs**: three sharing modes: private (just you), unlisted (anyone with the link), or public on the GPT Store. Unlisted is the right default for internal company use, public if you actually want strangers to find it.
- **Gemini Gems**: shareable within a Google Workspace organization. The same Workspace controls that govern your Drive apply.

Practical implication: if you want your office to share an agent, the platform choice may come down to "what plan does the office already pay for". Sharing also raises a privacy question covered in Chapter 5: everyone using the agent inherits whatever data is loaded into its instructions and reference files.

### A practical first step

Before paying for any of them, do this: take the longest prompt you have ever typed into a chatbot for repeated work. Set it up as a Claude Project (free tier), a ChatGPT custom instructions block (free for basic use), or a Gemini Gem (free tier). Run it three times on real tasks. You will know within an hour which platform suits how you work.

The most common mistake in Chapter 2: paying for premium on all three before exhausting the free tiers. Pick one. Use it for a week. Decide if it earns the subscription. The features that matter to you become clear quickly.

## Chapter 3: Prompt patterns that turn a chat into an agent

A chat is what you do when you ask a question. An agent is what you get when you encode a prompt so well that it produces useful work on the first try, every time, on any new input. The difference is the pattern. There are four patterns worth learning; once you know them, you can mix them.

![Four prompt patterns: role, step-by-step, critique, persona](prompt-patterns.png)

### Pattern 1: Role + Task + Constraints + Format

This is the foundation. Every good agent prompt has these four parts, in roughly this order.

> "You are an Israeli accountant specializing in freelancers. (ROLE) Read this list of invoices and produce a monthly VAT report draft, with one row per invoice plus a totals row. (TASK) Use 2026 VAT rate 18%. Exclude exempt categories. Flag anything over ₪10,000 for review. (CONSTRAINTS) Output as a Markdown table with columns: invoice date, client, amount net, VAT, amount gross, exempt yes/no, flag. (FORMAT)"

The constraints are what most beginners miss. Without them, the AI guesses what you want. With them, it produces something you can drop straight into your workflow. Constraints turn a guess into a deliverable.

### Pattern 2: Step-by-step thinking

When a task is complex, ask the AI to think through it explicitly before producing the answer. The output usually improves by 30 to 50 percent because the model effectively "shows its work" before committing.

> "Before drafting the contract, list the 5 most important clauses for this specific scenario and explain in one sentence each why this scenario needs it. Then write the contract."

This works because asking the AI to reason out loud first surfaces missing context (you may notice it does not know whether you want IP transferred to the client or retained, and you can fix that before the contract draft).

### Pattern 3: Critique mode

Have the AI critique its own output, then improve it. This often catches errors faster than you would.

> "Now read the contract you just drafted and list the 3 weakest clauses, the 2 most ambiguous sentences, and any clause that is missing entirely for this scenario. Then produce a revised version."

The critique step costs you nothing but a second prompt; the revised version is often noticeably better.

### Pattern 4: Persona

Sometimes the role you want is not just "an accountant" but a specific personality and style. A persona prompt encodes both expertise AND voice.

> "You are an Israeli marketing manager with 10 years at consumer SaaS startups. You write in a direct, no-fluff style. You prefer concrete examples over generic advice. You avoid hype words. Critique this landing page copy with that voice."

The persona pattern is what makes the difference between AI output that sounds like everyone else's AI output and AI output that sounds like a specific real person you would want to work with.

### Hebrew-specific tips

The biggest Hebrew-specific patterns:

- **When the SOURCE is Hebrew, work in Hebrew.** If you are summarizing a Hebrew document, write your prompt in Hebrew. The model handles same-language work better than cross-language.
- **When the SOURCE is English but the OUTPUT must be Hebrew, ask explicitly.** "Write the output in Hebrew" is not enough. "Write the output in natural Israeli Hebrew, suitable for a [specific audience]" produces dramatically better results.
- **For bilingual outputs**, separate the languages explicitly. "First write the response in Hebrew. Then write a short English summary."
- **For Hebrew that ends up in a formal document**, ask the agent to write a draft, then critique its own Hebrew naturalness (Pattern 3), then produce a revised version. Native Israeli readers detect translation-smell instantly; this two-pass approach catches most of it.

The most common mistake in Chapter 3: vague tasks. "Help me with this email" produces generic output. "Draft a 100-word formal Hebrew reply to this client complaint, acknowledging the issue, offering one concrete solution, and inviting a phone call" produces something you can send. The constraints are not optional; they are the prompt.

## Chapter 4: Real Israeli use cases worked end-to-end

This chapter shows four complete workflows, one per professional role. For each, you get the agent setup (the instructions you save once), the daily use pattern (what you do every time), and what to verify before acting on the output. Treat these as templates to adapt to your specific situation.

![Four Israeli use cases: accountant, lawyer, marketer, small business owner](israeli-use-cases.png)

### Use case 1: Freelance accountant prepares monthly VAT report draft

Agent setup (saved as a Claude Project or ChatGPT GPT once):

> "Role: Israeli accounting assistant for freelancers (osek murshe). Task: When the user pastes a list of monthly invoices, each with a category label the USER provided (חייב במע\"מ / שיעור אפס / פטור), produce a draft VAT report organized by category. Constraints: VAT rate 18% (since January 2025). Do NOT re-classify invoices yourself; use only the user-provided labels. Flag any invoice the user marked as 'אפס' or 'פטור' to remind them these have different input-VAT treatment. Note: chat agents are unreliable at arithmetic over many invoices; treat all totals as a draft to verify, not a final number. Format: Markdown table with one row per invoice plus a totals row at the bottom. Always end with a numbered list of 'Things to verify before submitting'."

Daily use: paste the month's invoices with categories you have already assigned, get the draft, recompute the totals yourself (or with a spreadsheet) before submitting, and only then transcribe to the gov.il VAT portal.

What to verify: every total (do the math yourself), the agent's organization of categories, and any invoice flagged. Distinguishing חייב מע"מ (VAT-charged) from שיעור אפס (zero-rated, no VAT charged but input credit allowed) from פטור (exempt, no VAT and no input credit) is a real source of misfilings; the agent should not be classifying these for you. Always confirm anything unusual against a primary source or your CPA / יועץ מס before submission.

**For the arithmetic specifically: use Code Interpreter / Analysis mode.** Chat agents do not actually do math; they predict what numbers should look like, which is why long invoice lists produce subtly wrong totals. ChatGPT's "Code Interpreter" (auto-enabled on paid plans, sometimes called "Advanced Data Analysis" or "Analysis" in the UI) and Claude's "Analysis tool" (the small toggle on the input bar) BOTH run a real Python session that does real arithmetic on your uploaded XLSX/CSV. Use one of those tools instead of chat for any spreadsheet work where the totals have to be correct. The verify-totals step is still your responsibility, but you start from a real computation rather than a guess.

**Local-folder option (via Claude Desktop + filesystem MCP, Chapter 2):** if your invoices live as PDFs in a single folder on your computer, you can skip the copy-paste step entirely. Approve the folder once via the Filesystem connector, then say "read all PDFs in /Users/me/Invoices/2026-05 and list them by category". For a freelancer with 60-100 monthly invoices, this saves the entire data-entry step.

### Use case 2: Solo lawyer drafts a standard service agreement

**For licensed lawyers only.** This use case is for an attorney drafting their own boilerplate faster, NOT for a non-lawyer to generate contracts to send to clients. In Israel, unauthorized practice of law is a regulated offence, and a non-lawyer who sends an AI-drafted contract as a final document exposes themselves to client-liability claims if the draft is flawed. If you are not a licensed עורך דין, use this section as an illustration only; do not deploy.

Agent setup:

> "Role: Israeli commercial lawyer specializing in service agreements. Task: When the user provides the parties and scope, draft a complete service agreement in both Hebrew and English. Constraints: Israeli governing law, Tel Aviv jurisdiction. Include payment terms, IP ownership, confidentiality, termination, dispute resolution. Mention force majeure briefly. Format: full agreement text, with Hebrew on top and English below. End with a list of 'Clauses to review before sending to client'."

Daily use: type the parties and scope ("Client: ACME Ltd; Scope: 6-month web development engagement; Rate: ₪500/hour"), get the draft, review the flagged clauses, edit as needed.

What to verify: every numeric and party detail. Every clause that the agent's checklist flags. The agent is doing the 80% of boilerplate; the lawyer's job is the 20% that matters.

### Use case 3: Marketing manager researches Israeli competitors

**Mandatory: enable web search / browsing on your platform before using this prompt.** Without live web search the agent will fabricate competitor names, pricing, and product launches with high confidence (the classic hallucination trap from Chapter 5). Claude Projects, ChatGPT GPTs, and Gemini all support web search, but it is often off by default; turn it on in the platform settings BEFORE running this use case.

Agent setup:

> "Role: Israeli marketing strategist with deep knowledge of the Israeli tech and consumer market. You have access to web search and you MUST use it for anything time-sensitive (competitor names, pricing, recent launches). Task: When the user names a product category, identify the 5 main Israeli competitors, summarize each one's positioning and pricing, list their recent product launches, and produce a one-page strategic memo with three concrete recommendations. Constraints: focus on companies operating in or selling to Israel. Be specific about pricing in ₪. If web search is unavailable or returns nothing for a specific claim, REFUSE to invent. Say 'I could not verify this' and skip that competitor or launch. Format: a one-page memo with sections: Competitors, Positioning Map, Recent Launches, Recommendations."

Daily use: name the category ("Hebrew speech-to-text for podcasters"), get the memo.

What to verify: pricing and recent launches especially. AI models have a training cutoff and may miss recent changes. Cross-check the top 2-3 competitors' current pricing on their actual websites before quoting numbers internally.

### Use case 4: Small business owner sets up Hebrew customer-email templates

Agent setup:

> "Role: Israeli customer service writer. Task: When the user describes a customer scenario, produce a Hebrew email template that the business can adapt. Constraints: natural Israeli Hebrew (not translated-from-English), polite but warm, ends with a clear next step. Format: subject line + email body + optional postscript. Always offer two variants: one formal, one more casual."

Daily use: describe the scenario ("Customer received a damaged product and is upset"), get two template variants, copy the better fit and personalize.

What to verify: the Hebrew naturalness for your audience. Read it aloud before sending. If anything sounds like translated English, ask the agent to rewrite in natural Israeli Hebrew specifically.

### The "this is a draft, you are the editor" principle

Notice that every use case above ends with verification by the human. That is intentional and non-negotiable. AI agents are excellent at producing first drafts, comprehensive structures, and consistent formatting. They are weak at knowing what is actually true right now in your specific situation. Your job is to be the editor. Their job is to be the writer who hands you a structured first draft.

If you ever find yourself accepting an AI's output verbatim without reading it, you have skipped the editor's job. The AI's mistakes become your mistakes. That is when AI starts to cause harm rather than create value.

For an Israeli daily-context reference (Sunday-Thursday work week, holiday calendar, formal Hebrew email conventions), the `israeli-personal-assistant` skill (`npx skills-il add localization/israeli-personal-assistant`) is a useful companion alongside whatever agent you build.

## Chapter 5: When AI agents fail (and what to do)

AI agents fail in a small number of predictable ways. Knowing these patterns is the difference between an agent that saves you hours and an agent that quietly inserts errors into your work. This chapter names the six most common failure modes for Israeli users specifically (the sixth is a privacy and data-handling failure that matters for any professional handling client data), and gives you a verify-before-trust protocol.

![Six failure modes and the verify protocol](failure-modes-checklist.png)

### Failure mode 1: Hallucinated facts

The model invents a specific-looking detail (a form number, a tax threshold, a court case, a regulation citation) that sounds plausible but is not real. This is the most dangerous failure mode because it is invisible: the made-up fact slots smoothly into otherwise correct prose.

Concrete examples that have appeared in real AI output for Israeli users: invented Bituach Leumi form numbers, wrong tax brackets that the model confidently asserts, made-up Knesset bill numbers, and shifted-by-one section numbers in citations of Israeli laws (the model swaps a real section for a number that does not exist, with no indication of uncertainty).

How to catch: any time the agent quotes a specific number, name, regulation, or threshold, treat it as unverified. The verify protocol below applies.

### Failure mode 2: Training cutoff (stale data)

The model's training data ends at some point in the past. For anything that changed since then (laws, prices, fund returns, political events, product launches), the model either confidently states the old value or hedges vaguely. Israeli regulatory data changes constantly; this is a near-permanent issue.

How to catch: ask the agent directly ("what year are you confident this number is from?"). If it cannot give you a specific recent year (2025 or 2026), the value is suspect.

### Failure mode 3: Missing your specific context

The model gives a generally-true answer that is wrong for your specific situation. "The standard severance pay rate is..." is true for most cases and wrong if the employee is under a Section 14 arrangement under the Severance Pay Law (which substitutes ongoing employer contributions for an end-of-employment lump sum, and changes the calculation entirely). Generic correctness with specific wrongness is one of AI's most common failure modes.

How to catch: tell the agent the specifics of your situation explicitly, even details you think are not relevant. Then ask "does anything in my situation change the standard answer?"

### Failure mode 4: No sources

The agent produces an authoritative-sounding answer with no citations. You cannot verify it. You cannot defend it if challenged. This is fine for low-stakes tasks (drafting a casual email) and dangerous for high-stakes ones (a tax position, a legal argument, a medical decision).

How to catch: ask "what is your source for that?". If the agent cannot point to a specific government page, statute, or authoritative document, treat the answer as a starting point for your own research, not a finished answer.

### Failure mode 5: Your data goes somewhere

This is not a hallucination failure; it is a privacy failure, and for Israeli professionals it is regulated. When you paste a client's contract, a patient's medical history, or an employee's salary data into a free-tier ChatGPT / Claude / Gemini, that data is sent to the provider's servers. On the free tiers and some paid tiers, the provider may USE that data to train their next model. Israeli Privacy Protection Law Amendment 13 (in force August 2025) treats client data as your responsibility: if you fed identifiable client information into a service that trained on it, you are on the hook.

Where the data actually goes, briefly:
- **ChatGPT free tier**: data is used for training by default. You can opt out in Settings → Data Controls. ChatGPT Team and Enterprise plans do NOT train on your data by default.
- **Claude free + Pro tiers**: Anthropic does not train on your conversation data by default for consumer plans (verify the current policy; it has changed). Claude Team and Enterprise plans add stronger contractual data protections.
- **Gemini free + paid tiers**: Google's data handling depends on which account (personal Gmail vs Google Workspace) you use. Workspace data has stronger protections; personal-account data has weaker ones.

How to catch (before the leak happens, not after):
- Before pasting client data: either redact identifiers (replace real names with "[CLIENT]", real ID numbers with "XXX-XXXX") or use the team/enterprise tier of your chosen platform.
- For anything truly sensitive (health records, criminal cases, financial accounts with account numbers), do not use a chat agent at all. Use a local-only tool, a manually-anonymized version, or a regulated workflow your professional body has approved.
- Read the data-handling page of your platform once a quarter; policies change.

If you are unsure whether your situation falls under Privacy Law Amendment 13, ask a lawyer who specializes in Israeli data protection. This is a real liability question, not a theoretical one.

### Failure mode 6: Biased or weird Hebrew output

Hebrew output that sounds like a translation, uses unusual word order, or makes Hebrew grammar mistakes (gender disagreement, wrong plural forms, calques from English). This is a register failure, not a factual failure, but it damages your credibility when the output goes out under your name.

How to catch: read the Hebrew aloud. Hebrew written by AI often reads "almost right." A native Israeli reader detects this in seconds. If anything sounds off, ask the agent to rewrite in natural Israeli Hebrew, then re-read aloud.

Where to read more: search for "Israel Privacy Protection Law Amendment 13" plus your professional body's guidance (Israel Bar Association for lawyers, Institute of Certified Public Accountants in Israel for CPAs, Ministry of Health guidance for clinicians). Most professional bodies have issued AI-use guidance in the past 18 months.

### The verify-before-trust protocol

Run this protocol on any AI output you plan to act on:

1. **Spot-check one specific claim.** Pick a number, a regulation, a name. Open the primary source (gov.il, kolzchut, official ministry page). Confirm the agent's claim matches. If it does not, the entire output is suspect.
2. **Ask the agent to challenge itself.** "What is the weakest claim in what you just said?" Often the agent will name the exact thing you should not trust.
3. **Cross-check across two platforms.** If Claude and ChatGPT both produce the same answer, your confidence goes up SLIGHTLY (modern frontier models share training data, so agreement is weak evidence). Primary-source verification (gov.il, kolzchut, official ministry pages) is the only strong evidence. If they disagree, dig deeper.
4. **Read it aloud (Hebrew especially).** Catches register issues that silent reading misses.
5. **Time-box your trust.** AI outputs about "current rates", "this year", "recently" decay fast. If the output is more than a week old, re-verify before relying on it.

### When to escalate to a human

The "this is not advice" rule, in one sentence: if a mistake here will cost you serious money, legal trouble, health consequences, or a regulated penalty, do not trust an AI agent alone. Call a licensed professional.

Concrete escalation triggers:
- Any tax position where you are not 100 percent sure of the answer (even small amounts compound through penalties and interest) → CPA (ro'eh heshbon) or tax advisor (yo'etz mas)
- Legal documents that will be signed by any party → lawyer (orech din)
- Medical questions beyond information lookup → doctor
- Pension / investment decisions → licensed pension advisor (yo'etz pensyoni)
- Anything criminal, contested, or regulatory → professional in that domain

AI agents are excellent at preparing you for those conversations (organizing the question, drafting initial documents, summarizing options). They are not replacements for the conversations themselves.

The most common mistake in Chapter 5: trusting an AI's first answer because it sounds confident. AI agents are trained to sound confident even when they are wrong. Build the verify habit. It is the single highest-leverage skill in this entire course.

## Chapter 6: Graduating to no-code automation

Chat-based agents (Claude Projects, ChatGPT GPTs, Gemini Gems) are excellent for tasks you do when you have ChatGPT open in front of you. They have an obvious limit: they require you to be there, paste the input, copy the output, and move it to the next system. For tasks that should run on their own schedule, pull from your existing tools, and write to your existing tools, you need the next step up: no-code workflow automation.

![Three-step staircase: chat, saved agent, no-code automation](chat-to-automation-stairs.png)

### When chat hits its limit

Three signs you have outgrown chat-based agents:

1. **You are doing the same chat task repeatedly on a schedule.** Every Monday morning you paste the same data, run the same prompt, copy the output. That is a workflow, not a chat.
2. **You are manually moving data between tools.** Email arrives → you summarize in ChatGPT → you paste into a spreadsheet → you send a reply. That whole loop should run by itself.
3. **The task fails when you are not present.** If a customer email needs a response within an hour and you are at lunch, chat-based agents do not help.

When you hit any of these, you are ready for no-code automation.

### The three main no-code automation tools

| Tool | Strength | Israeli context |
|---|---|---|
| **n8n** | Open-source, self-hostable, free for personal use; the most flexible | Excellent for Israeli setups because you can self-host on Israeli servers and integrate with local APIs (israeli-bank-scrapers, Morning, data.gov.il) |
| **Make.com** (formerly Integromat) | Visual builder, large library of pre-built integrations, good free tier | Strong on Israeli SaaS integrations (Morning, iCount, Monday.com, Cardcom, Tranzila) |
| **Zapier** | The most app integrations of any tool, easiest to start with | Less Israel-specific coverage but excellent for cross-app workflows (Gmail, Calendar, Slack, Notion, Airtable) |

All three let you build automation visually: trigger ("when a new email arrives") connects to action ("summarize via AI") connects to action ("write to spreadsheet") connects to action ("send Slack notification"). You drag boxes; you do not write code.

### Israeli use cases that fit each tool

**n8n use cases for Israeli users:**
- Pull Bank Hapoalim transactions daily via israeli-bank-scrapers, categorize them via AI, write to a Google Sheet
- Monitor a gov.il portal for new tender publications, AI-summarize each one, send to a Slack channel
- Pull invoices from Morning, AI-extract line items, sync to your accounting workflow

**Make.com use cases:**
- New row in Google Sheets → AI generates Hebrew marketing copy → schedule to LinkedIn at Israeli business hours
- WhatsApp Business message arrives → AI classifies as support/sales/spam → routes accordingly
- New Monday.com task assigned → AI drafts Hebrew kickoff email → sends from your Gmail

**Zapier use cases:**
- Calendly booking → AI personalizes a Hebrew confirmation email → sends via Gmail
- Stripe payment → AI generates a Hebrew receipt with Israeli VAT formatting → emails to customer
- New Notion page → AI translates to Hebrew → saves as a second Notion page

### The tradeoff: setup time vs. ongoing value

Chat-based agents take minutes to set up and require you to be present. No-code automation takes hours to set up the first time and runs without you forever after. The breakeven is roughly: if you are doing the same chat task more than twice a week, the no-code version pays back its setup time within a month.

### Recommended starting points for non-technical users

**Start with Make.com or Zapier.** Both are fully cloud-hosted (nothing to install) and built for non-developers. The `make-com-israeli-automations` skill (`npx skills-il add developer-tools/make-com-israeli-automations`) covers the Israeli ecosystem on Make.com (Morning, iCount, Monday.com, Cardcom, Tranzila). For Zapier, the visual builder and its 7,000+ app library let you start with no skill required at all.

**n8n is a developer-leaning option.** Self-hosting n8n requires comfort with Docker or a server you can administer. If you have a developer on call (or are willing to use a managed n8n cloud service), the `n8n-hebrew-workflows` skill (`npx skills-il add developer-tools/n8n-hebrew-workflows`) covers Israeli integrations like israeli-bank-scrapers, Morning, and data.gov.il. For a non-technical reader without dev support, Make.com and Zapier are the realistic on-ramp.

For a concrete worked example of a deployed AI-powered Israeli automation (customer support), see the `israeli-customer-support-automator` skill (`npx skills-il add communication/israeli-customer-support-automator`). It walks through a real production setup: Hebrew ticket classification, SLA management for Sunday-Thursday business hours, escalation rules per Israeli consumer protection law.

### The most common mistake in Chapter 6

Trying to build a complex automation before doing the task manually with a chat-based agent first. You do not yet know the edge cases, the variations, the decision points. Run the task manually in Claude / ChatGPT / Gemini for two weeks first. Notice what surprises you. THEN build the automation, because now you know what to automate.

The chat-based phase is not a stepping stone you are eager to leave behind. It is the discovery phase that makes the automation actually useful. Skip it and you will build an automation that runs perfectly but does the wrong thing.

### Closing

You now have a working mental model of AI agents, three platforms to choose between, four prompt patterns that actually produce useful output, four worked Israeli use cases to adapt, a failure-mode taxonomy with a verify protocol, and a clear next step if you want to graduate to no-code automation. The Israeli AI conversation is loud and confusing; the work itself is not. Pick one use case from Chapter 4 that matches your situation. Set it up on whichever platform from Chapter 2 fits how you work. Run it on real tasks for a week. The picture becomes clear quickly when you stop reading about AI and start using it.

## Companion skills

The course gives you a mental model for working with AI agents. The skills below handle the practical side and the Israeli ecosystem. Install them in your assistant and ask it questions directly while reading.

- **Make.com Israeli Automations** (`make-com-israeli-automations`), ready-made scenarios on Make.com with Morning, iCount, Monday.com, Cardcom, and Tranzila. Install: `npx skills-il add skills-il/developer-tools/make-com-israeli-automations`
- **n8n Hebrew Workflows** (`n8n-hebrew-workflows`), the next step if you have developer support, with connections to Israeli APIs. Install: `npx skills-il add skills-il/developer-tools/n8n-hebrew-workflows`
- **Israeli Daily Reference Guide** (`israeli-personal-assistant`), an assistant that knows the Israeli calendar, holidays, and reporting deadlines. Install: `npx skills-il add skills-il/communication/israeli-personal-assistant`
- **Israeli Customer Support Automator** (`israeli-customer-support-automator`), a full production automation example with SLA for the Israeli workweek. Install: `npx skills-il add skills-il/communication/israeli-customer-support-automator`
