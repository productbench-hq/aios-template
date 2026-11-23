---
name: writing-with-intent
description: Interviews you about who you write for, what they get, what you believe, what your writing does for your work, and what you'd never publish or write, then saves it as your writing intent so AI drafts are written for someone, not just about something. Use for /writing-with-intent, "my AI writing sounds generic", "set up my writing", or before writing posts under your own name.
disable-model-invocation: true
---

# writing-with-intent

**What it does:** a short interview, one question at a time, that turns what you know about your own writing into `context/writing-intent.md`. Your AI reads it before every draft you'll publish under your name.

**Not in scope:** writing posts; business documents (PRDs, updates, decision docs), whose intent changes with every document; describing your voice with adjectives. Your voice comes in as examples and rejected lines, never as a description.

**Why intent, not a voice guide:** you can describe your intent: who you write for and why. You can't describe your taste: "punchy, casual, a little bold" fits a million writers. So the document holds your intent in your words, and your voice only as evidence.

## Steps

### 1. Start or refresh

If `context/writing-intent.md` exists, ask which section to update and run only those questions. Otherwise say one line: about 15 minutes, one question at a time, skip anything.

**Done when:** you know which questions to ask.

### 2. Intent

Ask these in order, one at a time. Wait for each answer.

1. Who do you write for?
2. After reading you, what can they do, or see differently, that they couldn't before?
3. What do you believe about your field that perhaps isn't shared by everyone?
4. What should your writing do for your work?
5. What would you never publish? Think of content, not style: invented stories, hype, borrowed opinions, anything else.

How to ask:
- Each question asks one thing. Keep it short. No praise, no summaries between questions.
- Push back only when an answer is unclear. A group of readers is fine; ask only if it's unclear who's in it or what they want. A buzzword ("value", "insights") isn't an answer: ask what they mean, with an example.
- When they make a claim about themselves, ask for something that actually happened.
- At most two follow-ups per question. If they say an answer stands, or "skip", move on.
- Never suggest answers. Use their words.

**Done when:** each of the five is answered or skipped.

### 3. Voice, shown, not described

6. Ask them to paste two or three passages they wrote and are proud of. Keep them word for word.
7. Show the pattern list from the Reference as a table, and ask which ones they'd never want in their writing. They reply with numbers. Then ask if they want to add any of their own, with an example.

People recognise bad writing faster than they can describe it, so show the list, don't ask them to name patterns.

**Done when:** passages are in (or skipped) and the never-write list is picked.

### 4. Draft the document

Use the template in the Reference. Their words wherever possible, quoted. No adjectives about their voice anywhere. One page at most. Show it in the chat and wait for a clear yes or changes.

**Done when:** they say yes.

### 5. Save and wire it in

Save to `context/writing-intent.md`. Then propose this line for the Voice section of `CLAUDE.md`, show it, and add it only on a yes:

> Before drafting anything I'll publish under my name, read `context/writing-intent.md`, ask me its three questions for this piece, and check the draft against "What I never publish" and "Lines I'd never write".

Report in one line what was saved and where.

**Done when:** the file is saved, and the `CLAUDE.md` line is added or declined.

## Reference

### Patterns to pick from

| # | Pattern | Example |
|---|---|---|
| 1 | Not X, it's Y | "This isn't a tool. It's a mindset shift." |
| 2 | Question opener | "Ever feel like your inbox runs your day?" |
| 3 | Groups of three | "Faster, smarter, and more human." |
| 4 | Colon reveal | "The secret? Consistency." |
| 5 | Hype words | "A game-changer that will supercharge your workflow." |
| 6 | Big scene-setting | "In today's fast-paced world, AI is everywhere." |
| 7 | Signposting | "Let's dive in." / "Here's the thing." |
| 8 | Filler hedges | "It's important to note that…" |
| 9 | Short contrast pairs | "Tools change. Habits don't." |
| 10 | Drama line breaks | A one-sentence paragraph. For effect. |
| 11 | Fake confession | "I'll be honest: I used to struggle with this too." |
| 12 | Bold labels everywhere | "**The takeaway:** …" before every point |
| 13 | Recap ending | "In short, …" / "At the end of the day, …" |
| 14 | Reply bait | "Hit reply, I read every answer." / "What do you think?" |
| 15 | Em dashes | "AI can help — but only if you let it." |
| 16 | Both-sides balance | "While X has benefits, it also has drawbacks." |

### Document template

```markdown
# My writing intent

## Who I write for
## What they get
## What I believe
## What my writing does for my work
## What I never publish
## Passages that sound like me
## Lines I'd never write
| Pattern | Example | Why |

---

For every piece, answer three questions first: Who is this for? What can they do after reading it? What do I ask of them at the end, if anything?
```

## Example

From a real run.

**Pushback that helped:** "What should readers get?" → "Something actionable, or it sparks something." → "Give me a real example." → "Readers of my last post gave their AI an instruction to work at a higher altitude, and tried the skill I shared." The example went into the document.

**Pushback that didn't:** the user named a group of readers and was pushed to picture one person. They found it annoying: a clear group is enough. Hence the rule in step 2.
