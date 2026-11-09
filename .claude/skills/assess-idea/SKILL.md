---
name: assess-idea
description: Assess feature requests against 10 criteria to build or not build. Use when a user invokes /assess-idea or asks to "assess", "evaluate", or "analyze" a feature request for build decision. Produces a full assessment document covering all 10 criteria with confidence levels, then summarizes into a pro/con list for the build decision.
---

# Assess Idea: Feature Request Evaluation

Evaluate any feature request against 10 assessment criteria to surface reasons to build or not build.

## Core Philosophy

This skill doesn't decide. It illuminates. By examining a request through multiple lenses, we surface the arguments for and against - with honesty about what we know vs. assume vs. don't know.

## Workflow

### 1. Receive the Request

Accept any feature request. If too vague, ask 1-2 clarifying questions.

### 2. Create Full Assessment Document

Elaborate on each of the 10 criteria. For each criterion:
- Analyze how it applies to this specific request
- Provide substantive reasoning (not just generic statements)
- Assign a confidence level with brief justification
- Note what would change the assessment

Save as `assess-[short-descriptor]-full.md`

### 3. Create Pro/Con Summary

After the full assessment, synthesize into:
- Which criteria are most relevant for this decision
- Pro arguments (reasons to build)
- Con arguments (reasons not to build)
- Key questions that would change the decision

Reference the full document for deeper exploration.

Save as `assess-[short-descriptor]-summary.md`

### 4. Present Summary to User

Show the pro/con summary directly in conversation. Let user know the full assessment document exists for deeper exploration.

### 5. Draft Clarification Email

After the assessment, draft a friendly follow-up email to the person who requested the feature. The email should:

**Tone:** Warm, appreciative, and collaborative. Value the idea genuinely — acknowledge what's exciting about it and why it caught your attention. Never make the requester feel like their idea is being interrogated.

**Structure:**
1. **Thank and appreciate** — Start by thanking them for the idea and highlighting what's compelling about it
2. **What we understood** — Paraphrase the request back in your own words to confirm understanding. This shows you took the idea seriously and gives them a chance to correct any misunderstanding
3. **Clarifying questions** — Ask targeted questions drawn from the assessment, focusing on:
   - **Blind spots** (🔴 confidence) — Things we have zero data on. These are the most important to ask about because we're making decisions in the dark
   - **Assumptions** (🟡 confidence) on high-relevance criteria — Where our reasoning could be completely wrong if the assumption is off
   - **Critical criteria** — Questions tied to the criteria that matter most for this specific decision (the "Focus on" items from the summary)
4. **Close warmly** — Express enthusiasm about exploring this together

Keep the email concise (no more than 5-7 questions). Group questions thematically rather than by criterion name — the requester shouldn't need to know about the assessment framework.

Save as `assess-[short-descriptor]-email.md`

---

## The 10 Assessment Criteria

### 1. User/Customer Value
*How much value does this generate for the user?*
- Does this solve a real problem users have?
- How painful is the current state?
- How much better does this make their experience?
- Is this a "nice to have" or a "can't live without"?

### 2. Business Impact
*What is the financial impact?*
- Revenue potential (new revenue, retained revenue, expanded revenue)
- Cost reduction or efficiency gains
- Indirect financial effects (reduced support load, lower churn)

### 3. Strategic Alignment
*Does this align with company/product plans?*
- Connection to stated company strategy
- Fit with product roadmap commitments
- Alignment with current quarterly/annual priorities
- Does it reinforce or dilute our strategic position?

### 4. Goal Contribution
*Does this help us focus on the right goals?*
- Which specific goals does this serve?
- How directly does it contribute?
- Does it move a metric we're actively trying to move?
- Could it distract from more important goals?

### 5. Market & Competitive Landscape
*Is this important for competitive advantage?*
- Are competitors doing this? Should we care?
- Does this create differentiation?
- Is the market expecting this as table stakes?
- Does this open new market opportunities?

### 6. Risk & Urgency
*Are there risks or urgencies requiring quick action?*
- Legal or compliance requirements
- Security vulnerabilities
- Bugs affecting users now
- Time-sensitive market windows
- Contractual obligations

### 7. Long-term Vision
*Does this comply with where we're heading?*
- Does this move us toward our north star?
- Will this age well or create future debt?
- Does it expand or constrain future options?
- Is this building toward something bigger?

### 8. Segmentation
*Who benefits, and how many?*
- Which customer/user segments are affected?
- What's the size of these segments?
- Are these segments we want to grow?
- Does this serve our most valuable users or our broadest base?

### 9. Feasibility
*Can we actually build this?*
- Do we have the technical capability?
- Are there dependencies or blockers?
- Do we have the right skills on the team?
- Are there external constraints (APIs, platforms, regulations)?

### 10. Resources & Effort
*How much will this take?*
- Development effort (rough sizing)
- Design and research needs
- Cross-team dependencies
- Ongoing maintenance burden
- Opportunity cost of what we won't do instead

---

## Confidence Levels

For each criterion, assign a confidence level:

| Level | Meaning | Use When |
|-------|---------|----------|
| 🟢 **Evidence-Based** | We have data | Research, metrics, validated facts |
| 🔵 **Committed** | Decision made | Roadmap items, contracts, stated priorities |
| 🟡 **Assumed** | Educated guess | Logical inference, stated as assumption |
| 🔴 **Blind** | Unknown | No data, no basis for assumption |

---

## Output Guidelines

### Full Assessment Document
- Each criterion gets its own section
- 2-5 sentences of substantive analysis per criterion
- Confidence level with 1-sentence justification
- Be specific to the request, not generic

### Pro/Con Summary
- Start with relevance table (which criteria matter most)
- Group pros by theme (User Value, Business, etc.)
- Group cons by theme
- End with "decision hinges on" questions
- Include "My Read" synthesis at the end
- Reference full document for details

### Clarification Email
- Warm, appreciative tone — never make the requester feel questioned or doubted
- Include a "What we understood" section to paraphrase back the request
- Draw questions from blind spots (🔴), key assumptions (🟡), and high-relevance criteria
- Group questions by theme, not by assessment criterion names
- Maximum 5-7 questions — focused and actionable
- Close with genuine enthusiasm

---

## Templates

See `references/assessment-template.md` for full assessment format.
See `references/summary-template.md` for pro/con summary format.
See `references/email-template.md` for clarification email format.
