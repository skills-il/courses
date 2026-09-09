---
name: ai-agents-for-everyone
description: A 6-chapter non-technical course on AI agents for Israeli professionals and small business owners. Teaches the difference between a chatbot and an agent, how to set one up on Claude Projects / ChatGPT Projects / Gemini Gems without writing code, prompt patterns that actually work, and four worked Israeli use cases (accountant, lawyer, marketer, small business). No coding required.
license: MIT
---

# AI Agents for Everyone

## Legal notice

This course is free educational material, written with the assistance of an AI model. It teaches how to configure AI agents and includes example prompt text, with no involvement, review, or approval by a lawyer, accountant, or tax advisor in respect of the output your agent actually produces. The course is not legal advice, not tax advice, and not accounting advice, and it is not an agreement, a contract, a professional opinion, or a filed return. It is explanatory material about working with AI agents.

Any document an AI agent drafts from the prompt text in this course is an automated draft for personal organisation only. It is not a document prepared by a lawyer and it cannot be relied on as evidence. Drafting documents of a legal character for another person is reserved by law to a licensed Israeli advocate, so a document your agent drafts must not be sent to a client, a counterparty, or an authority as a final document, and must not be signed, without review by a licensed lawyer. An AI agent can err, omit a material clause, or state a wrong conclusion, and over long lists it can produce incorrect totals without flagging them.

Responsibility for tax reporting and payment is yours, the binding computation is the Tax Authority's, and representation before the Tax Authority is reserved to those permitted by law. If you enter client, employee, or patient details into an AI service, responsibility for that data remains yours under the Privacy Protection Law and Amendment 13; Chapter 5 sets out what to check before pasting such data.

This course is not a substitute for advice that takes account of the particular data and needs of each person, and any use of it, and of the output of agents you build from it, is at the user's sole responsibility.


The conversation about AI in Israel right now is loud and confusing. Half the headlines say AI will replace your job; the other half say it can barely write a coherent email. Neither is true, and neither is useful if you actually want to use this technology to get work done. This course is for the millions of Israelis who are not developers, who have a job to do, who hear "AI agents" thrown around constantly, and who want a clear answer to a small set of questions: what is an AI agent, when should I use one, how do I set one up without writing code, and how do I avoid the obvious traps.

Six chapters. Four real worked Israeli use cases (a freelance accountant, a solo lawyer, a marketing manager, a small business owner). Honest about what AI can and cannot do. By the end, you will have a working agent doing real work for you, and a clear sense of when to push the agent further versus when to call a human professional.

## Course Overview

| Chapter | What you walk away with |
|---|---|
| 1. What is an AI agent (in plain language) | The difference between a chatbot and an agent, with concrete Israeli examples |
| 2. The three platforms (plus Claude Desktop for local files) | Claude Projects, ChatGPT Projects, Gemini Gems, and a separate note on Claude Desktop + filesystem MCP for "read this whole folder" workflows. File uploads and team sharing covered too. |
| 3. Prompt patterns that turn a chat into an agent | Four reusable patterns that move you from "asking questions" to "getting work done" |
| 4. Real Israeli use cases worked end-to-end | Four scenarios: accountant, lawyer, marketer, small business owner |
| 5. When AI agents fail (and what to do) | Six failure modes including a privacy/data-handling one, a verify-before-trust protocol, and when to call a human |
| 6. Graduating to no-code automation | When chat hits its limit, and how to step up to n8n / Make.com / Zapier |

Important framing before you start: nothing in this course is professional advice. AI agents are research tools and draft generators; they are not a licensed accountant, lawyer, doctor, or financial advisor. The course teaches you how to make AI agents productive. It does NOT teach you when their output is safe to act on without human review. That judgment is yours.

## Chapter 1: What is an AI agent (in plain language)

The simplest way to understand the difference between a chatbot and an AI agent is to compare what each one does for the same request.

You open ChatGPT and type: "I need to draft a contract for a new freelance client. Where do I start?"

A chatbot replies with a paragraph of general advice. Read carefully, restate the scope, define payment terms, etc. It is correct, generic, and only marginally useful. You still have to do all the actual work.

An agent set up for the same purpose does something fundamentally different. It asks you four questions: who is the client, what is the scope, what is the rate, what is the payment term. It uses your answers to produce something you can actually walk into a meeting with: the checklist of points this particular engagement has to settle (invoicing and VAT terms, payment timeline, who owns the work product, what notice either side must give), what a normal answer looks like for each, and the specific questions to put to a lawyer. It does not hand you a contract. Drafting a document of a legal character for someone else is reserved by law to a licensed Israeli advocate, and Chapter 4 comes back to what that means in practice.

The chatbot answers a question. The agent does a task. That is the entire distinction.

### Three real Israeli examples (so the difference is concrete)

**Freelance accountant preparing monthly VAT report.** Chatbot: explains what VAT is. Agent: walks through the freelancer's monthly invoices, organizes them by the categorization the freelancer provided (VAT-charged, zero-rated, or exempt), helps double-check the totals, and flags anything that looks unusual for review before submission. (Note: chat-based agents are unreliable at arithmetic over long invoice lists; treat the totals as a draft to verify, not a final number.)

**Solo lawyer drafting a service agreement.** Chatbot: lists the clauses a service agreement typically contains. Agent: asks the licensed lawyer about the parties, the scope, the term and the governing law, and produces a first draft in Hebrew and English with the standard Israeli clauses (jurisdiction, dispute resolution, IP ownership, termination) for that lawyer to edit and take responsibility for. This one is gated on holding a licence, and Chapter 4 explains why.

**Marketing manager researching Israeli competitors.** Chatbot: lists generic competitor-research methods. Agent: takes the manager's product category, identifies the 5 main Israeli competitors, summarizes each one's positioning and pricing, lists their recent product launches, and produces a one-page strategic memo with three concrete recommendations.

In every case, the agent does work the chatbot only describes. That is what you are setting up.

### The "stop typing into a chat box" moment

If you find yourself repeatedly typing similar long prompts into a chatbot ("Please summarize this email in Hebrew, formal tone, three bullet points, with a suggested reply..."), you are doing the agent's job for it. The whole point of an agent is to encode that long prompt ONCE, then use it many times by just dropping in the new email each time. Chapter 2 shows you how to do that on the three main platforms.

The most common mistake in Chapter 1: trying to make a chatbot do everything in one mega-prompt. Symptom: your prompts are 400 words long and you copy-paste them every time. Fix: that mega-prompt should be an agent's setup, not a daily message. Move it to a Claude Project, a ChatGPT Project, or a Gemini Gem once. Use the agent for the daily work.

If you want a daily-reference companion for Israeli business context (work week, holidays, formal Hebrew email norms), install `israeli-personal-assistant` (`npx skills-il add localization/israeli-personal-assistant`). It pairs naturally with anything you build using this course.

## Chapter 2: The three platforms for non-developers

You have three serious options for setting up an agent without writing code: Claude Projects (Anthropic), ChatGPT Projects (OpenAI), and Gemini Gems (Google). Each one lets you save a prompt and a set of instructions once, then re-use them in a clean conversation each time. The differences matter for Israeli users and they matter for which kind of task you are doing. One thing changed in 2026 and it is worth knowing before you read further: ChatGPT's custom GPTs, which most guides still present as the OpenAI answer here, can no longer be created on a personal account. The ChatGPT section below explains what replaced them.

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

Free tier: usable for short sessions, and it does include Projects, up to five of them. Claude Pro: $17/month billed annually or $20/month billed monthly, with expanded use and access to the best Claude models. Heavy users (long documents, many daily conversations) may hit Pro limits and upgrade to Claude Max, which starts at $100/month. Prices checked September 2026.

### ChatGPT Projects (OpenAI), and what happened to GPTs

**Read this before you follow any older guide.** During 2026 OpenAI closed new GPT creation on personal accounts. Free, Go, Plus and Pro can no longer build or publish a GPT; that now requires a Business, Enterprise or Edu workspace. Existing GPTs still work, you can still use other people's GPTs from the GPT Store, and an existing GPT can still be edited if your plan allows it. But if you are a freelancer, a solo practitioner or a small business owner on a personal plan, the "create a GPT" route described in most tutorials written before that date is closed to you. Almost every guide you will find online still describes it.

So what do you actually use on ChatGPT? **Projects and custom instructions.** A ChatGPT Project is the same idea as a Claude Project: a workspace with its own instructions and uploaded files, where every conversation inherits the setup. Custom instructions apply your standing preferences across all chats. Between them you get most of what a personal-account user wanted a GPT for.

Best for: people already living in ChatGPT, and cases where someone else's pre-built GPT from the Store already does most of what you need.

Setup steps:
1. Go to chatgpt.com and sign in
2. Open Projects in the left sidebar and create one
3. Give the project its instructions, the standing brief the assistant should always follow
4. Upload the reference files it should always have available
5. Start conversations inside the project rather than in a plain chat

On pricing, one structural point rather than a number: OpenAI added a cheaper tier called **Go** below Plus during 2026, so the first paid step is now considerably smaller than a Plus subscription. Israeli prices differ from the US list price and OpenAI changes them without much notice, so read chatgpt.com/pricing yourself before subscribing rather than trusting any figure quoted in a guide, this one included. Check while you are there whether the tier you are considering is ad-supported, because some of the cheaper tiers now are.

One thing not to carry over from older material: model names. OpenAI retired the entire GPT-4 family during 2026, so there is no "GPT-4-class" model in ChatGPT any more, and it has retired later families since. Rather than learn the current names, which change every few months, just take the most capable model your plan offers. Chapter 5 comes back to why this churn matters.

### Gemini Gems (Google)

A Gem is Google's equivalent of a saved custom AI assistant. The main differentiator: integration with Google Workspace (Gmail, Docs, Drive, Calendar). If your work happens in Google's ecosystem, Gems can read from your Drive and reference your Gmail and Calendar more fluidly than the other two platforms. (For write actions like "send this email" or "create this calendar event", you typically still need to approve each action manually; Gems do not silently send mail.)

Best for: workflows that involve your Google docs, your Gmail, your Calendar. Excellent for small business owners running on Google Workspace.

Setup steps:
1. Go to gemini.google.com, sign in with your Google account
2. Click the "Gems" section in the sidebar
3. "Create new Gem"
4. Give it a name, write the instructions, optionally tie it to specific Google Drive folders
5. Save and use

Free tier includes basic Gem usage. Above it, checked September 2026 on Google's Israeli pricing: **Google AI Plus at ₪19/month**, **Google AI Pro at ₪74.90/month**, and Google AI Ultra from ₪390/month. The Pro tier is the one that unlocks the more capable models and the higher usage limits. Google rebrands and repositions this product often, and it has moved the price down as well as up, so check gemini.google.com for current naming and pricing before subscribing.

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
- **ChatGPT Projects**: a project is private to your account. Sharing it with colleagues is a Business/Enterprise workspace feature, not something a personal plan offers. If you need a teammate to use the same setup on a personal plan, send them the instruction text and have them create their own project.
- **Gemini Gems**: shareable within a Google Workspace organization. The same Workspace controls that govern your Drive apply.

Practical implication: if you want your office to share an agent, the platform choice may come down to "what plan does the office already pay for". Sharing also raises a privacy question covered in Chapter 5: everyone using the agent inherits whatever data is loaded into its instructions and reference files.

### A practical first step

Before paying for any of them, do this: take the longest prompt you have ever typed into a chatbot for repeated work. Set it up as a Claude Project (free tier), a ChatGPT custom instructions block (free for basic use), or a Gemini Gem (free tier). Run it three times on real tasks. You will know within an hour which platform suits how you work.

The most common mistake in Chapter 2: paying for premium on all three before exhausting the free tiers. Pick one. Use it for a week. Decide if it earns the subscription. The features that matter to you become clear quickly.

## Chapter 3: Prompt patterns that turn a chat into an agent

A chat is what you do when you ask a question. An agent is what you get when you encode a prompt so well that it produces useful work on the first try, every time, on any new input. The difference is the pattern. There are four patterns worth learning; once you know them, you can mix them.

### Pattern 1: Role + Task + Constraints + Format

This is the foundation. Every good agent prompt has these four parts, in roughly this order.

> "You are an Israeli accountant specializing in freelancers. (ROLE) Read this list of invoices and produce a monthly VAT report draft, with one row per invoice plus a totals row. (TASK) Use 2026 VAT rate 18%. Exclude exempt categories. Flag anything over ₪10,000 for review. (CONSTRAINTS) Output as a Markdown table with columns: invoice date, client, amount net, VAT, amount gross, exempt yes/no, flag. (FORMAT)"

The constraints are what most beginners miss. Without them, the AI guesses what you want. With them, it produces something you can drop straight into your workflow. Constraints turn a guess into a deliverable.

### Pattern 2: Step-by-step thinking

When a task is complex, ask the AI to think through it explicitly before producing the answer. It generally produces better results, because the model effectively "shows its work" before committing to an answer.

> "Before writing the competitor memo, list the 5 questions this memo has to answer for a marketing manager choosing a positioning, and explain in one sentence each why this market needs it. Then write the memo."

This works because asking the AI to reason out loud first surfaces missing context. You may notice it does not know whether you are positioning against price or against feature depth, and you can fix that before it writes a word.

### Pattern 3: Critique mode

Have the AI critique its own output, then improve it. This often catches errors faster than you would.

> "Now read the customer email you just drafted and list the 3 weakest sentences, the 2 places a frustrated customer could misread as a brush-off, and anything a customer would still have to ask us after reading it. Then produce a revised version."

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

### Use case 1: Freelance accountant prepares monthly VAT report draft

Agent setup (saved as a Claude Project or ChatGPT Project once):

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

**Mandatory: enable web search / browsing on your platform before using this prompt.** Without live web search the agent will fabricate competitor names, pricing, and product launches with high confidence (the classic hallucination trap from Chapter 5). Claude Projects, ChatGPT Projects, and Gemini all support web search, but it is often off by default; turn it on in the platform settings BEFORE running this use case.

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

Where the data actually goes, briefly. Do not assume any of these is off:
- **ChatGPT consumer tiers**: check Settings → Data Controls and set the training option deliberately. Do not assume it is off on a consumer plan. Business and Enterprise workspaces are governed separately.
- **Claude consumer tiers (Free, Pro, Max)**: there is a setting that controls whether your chats are used to improve the models, and you are asked to choose. Do not assume it is off, and do not assume an older guide is still right about it. If you allow it, conversations may be retained for up to five years; if you do not, retention is 30 days. Check Settings → Privacy and set it deliberately. Commercial tiers (Claude for Work, the API) are excluded by default.
- **Gemini**: handling depends on which account you use. A Google Workspace account has stronger protections than a personal Gmail account. Check your Gemini Apps Activity setting.

**The never-paste list.** Redaction is a skill and most people are bad at it, so start from a list rather than from judgement. Do not paste, upload, or photograph any of these into a consumer AI tool:
- **תעודת זהות numbers**, and photographs of ID cards, passports or driving licences. This one deserves particular attention, because Chapter 2 taught you to photograph Israeli documents and upload them, and almost every official Israeli document carries an ID number in its header. Crop or cover it first.
- **Health and medical records** of any kind, which are specially sensitive under Israeli law.
- **Your customer or client list**, which is itself a מאגר מידע.
- **Payroll files, salary data, bank account numbers and card numbers.**
- **Anything covered by professional privilege**, which for a lawyer means essentially everything a client told you.
- **Biometric data.**

And note what redaction actually requires. Replacing the name with "[CLIENT]" while leaving the ID number, the address, the employer and the case details in place is not de-identification; the combination re-identifies the person on its own. Redaction means removing every direct identifier AND the combinations that point back to one individual. When you are unsure, the answer is do not upload.

How to catch it before the leak rather than after:
- Set the training toggle on every platform you use, deliberately, today. It takes two minutes per platform and it is the single highest-value thing in this chapter.
- For anything on the never-paste list, do not use a chat agent at all. Use a local-only tool, a genuinely anonymised version, or a workflow your professional body has approved.
- Read the data-handling page of your platform once a quarter. Policies change, and the Claude one above changed after this course was first published.

**What Amendment 13 actually asks of you.** The course mentions the law; here is the part a small business has to act on. It applies to every body holding personal data in Israel, so "I am one person with a laptop" does not put you outside it. Size affects the penalty, not the duty: the amendment sets reduced caps for small and micro businesses, and total sanctions are capped as a share of annual turnover, but the obligations themselves still apply to you. A serious security incident must be reported to the Privacy Protection Authority **within 72 hours**, and a mis-scoped Claude Desktop file connector that exposes a client folder is an incident, so the clock is a real clock. The Authority now has the power to impose administrative fines directly, and it has started using it: the first sanction under the amendment was ₪256,000 on a health fund that learned of a serious security incident and did not report it promptly. The exposure is a regulator, not only an unhappy client. The law also brings privacy-by-design duties and broader rights for the people whose data you hold. The formal duty to appoint a privacy officer (ממונה על הגנת הפרטיות) reaches data brokers, public bodies, and those doing systematic monitoring or large-scale sensitive processing, so most single-person practices sit below it, which is worth knowing because it is the first question everyone asks.

The mental model that makes all of this legible: when you put your customers' details into a foreign AI service, you have outsourced part of your database to a third party. That is a regulated act, not a neutral one, and the responsibility stays with you.

**If you hold a professional licence, there is a second layer.** For a lawyer, sending client matter to a third-party processor raises client privilege (חיסיון עורך דין־לקוח), not just data protection: whether privilege survives, and whether the client's informed consent is needed first. For an accountant, the confidentiality duty to the client is the equivalent question. Neither is answered by this course. Check your professional body's current guidance before the first upload, not after.

If you are unsure whether your situation falls under Amendment 13, ask a lawyer who specialises in Israeli data protection. This is a real liability question, not a theoretical one.

### Failure mode 6: Biased or weird Hebrew output

Hebrew output that sounds like a translation, uses unusual word order, or makes Hebrew grammar mistakes (gender disagreement, wrong plural forms, calques from English). This is a register failure, not a factual failure, but it damages your credibility when the output goes out under your name.

How to catch: read the Hebrew aloud. Hebrew written by AI often reads "almost right." A native Israeli reader detects this in seconds. If anything sounds off, ask the agent to rewrite in natural Israeli Hebrew, then re-read aloud.

Where to read more: search for "Israel Privacy Protection Law Amendment 13" plus your professional body's guidance (Israel Bar Association for lawyers, Institute of Certified Public Accountants in Israel for CPAs, Ministry of Health guidance for clinicians).

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

Chat-based agents (Claude Projects, ChatGPT Projects, Gemini Gems) are excellent for tasks you do when you have the app open in front of you. They have an obvious limit: they require you to be there, paste the input, copy the output, and move it to the next system. For tasks that should run on their own schedule, pull from your existing tools, and write to your existing tools, you need the next step up: no-code workflow automation.

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

**Start with Make.com or Zapier.** Both are fully cloud-hosted (nothing to install) and built for non-developers. The `make-com-israeli-automations` skill (`npx skills-il add developer-tools/make-com-israeli-automations`) covers the Israeli ecosystem on Make.com (Morning, iCount, Monday.com, Cardcom, Tranzila). For Zapier, the visual builder and its 9,000+ app library let you start with no skill required at all.

**n8n is a developer-leaning option.** Self-hosting n8n requires comfort with Docker or a server you can administer. If you have a developer on call (or are willing to use a managed n8n cloud service), the `n8n-hebrew-workflows` skill (`npx skills-il add developer-tools/n8n-hebrew-workflows`) covers Israeli integrations like israeli-bank-scrapers, Morning, and data.gov.il. For a non-technical reader without dev support, Make.com and Zapier are the realistic on-ramp.

For a concrete worked example of a deployed AI-powered Israeli automation (customer support), see the `israeli-customer-support-automator` skill (`npx skills-il add communication/israeli-customer-support-automator`). It walks through a real production setup: Hebrew ticket classification, SLA management for Sunday-Thursday business hours, escalation rules per Israeli consumer protection law.

### Before you turn an automation on: the runaway problem

A chat agent costs you a message. An automation costs you every time it fires, and it fires without you watching. This is the one failure mode in Chapter 6 that can bill you while you sleep, and it catches non-technical users far more often than a wrong output does.

The shape of the accident is always the same: something triggers more often than you expected, or triggers itself. An automation that watches a folder and also writes to that folder. A scenario that answers an email and thereby generates a new inbound email. A trigger on "row added" attached to a sheet that another automation is filling. Each of these is a loop, and the tools will happily run it thousands of times.

Four things to do before you switch anything on, in this order:

1. **Understand your unit.** These tools do not all bill for the same thing, and the differences are large. One may charge per operation or credit consumed inside a run, another per task, another per workflow execution regardless of how many steps that execution contains. Free plans also tend to enforce a minimum gap between runs, which means nothing on a free plan is truly near real time. Open your tool's pricing page and find two things before you build: what the billing unit is, and what the free plan's minimum interval is.
2. **Run it manually first.** Every one of these tools lets you execute a scenario once by hand. Do that, look at what it produced, and only then attach a trigger.
3. **Set the schedule as wide as the job allows.** "Every 15 minutes" and "once an hour" feel similar to a person and are four times apart to your bill. Most small-business tasks are genuinely fine hourly or daily.
4. **Check that the output cannot feed the input.** Write down what starts the automation and what it produces. If those two things touch the same inbox, folder, or sheet, you have a loop. Route the output somewhere the trigger does not watch.

Then set a usage alert in the tool, and look at your run history after the first day and again after the first week. Both Make and Zapier show you the count.

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
