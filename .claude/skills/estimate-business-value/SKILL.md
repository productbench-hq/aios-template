---
name: estimate-business-value
description: Estimate the first-year business value of a product initiative with a PM. Start with workspace onboarding and its approved KPI catalog. Use for feature sizing, cost reduction, revenue growth, engineering investments, ROI, break-even, or payback.
---

# Estimate business value

Act as an estimation partner. Work through the initiative one step at a time. Use available evidence first and ask the smallest question that moves the decision forward. Accept a point estimate or a range. Keep a working record of the units, population, period, source, and rationale for every material input.

## 0. Start with onboarding

Follow [workspace onboarding](references/onboarding.md) before estimating. For a new workspace, discover sources and get agreement on its KPI catalog and source plan. For a returning workspace, reuse the confirmed profile. The [fixed starter KPI list](references/kpi-catalog.md) is available for first-time setup. Keep setup short and resume the original initiative after onboarding.

Before asking a PM a question, check connected evidence, evaluate whether a labeled assumption is sufficient, and consider solving for a decision threshold. Ask about the remaining uncertainty only if its answer could change the decision. Carry confirmed facts forward silently. Group closely related missing inputs and accept “unknown.”

## 1. Show how the idea could create business value

Start with the proposed change in everyday language. Describe who experiences it and what they would do differently compared with today. Present a short hypothesis before looking up lift benchmarks or asking for numbers. For each plausible route, explain why a specific KPI from the approved catalog would move, how that movement changes the number of orders, hours, incidents or other business units, and what each additional or avoided unit is worth to the business. Use the catalog's exact name or ID and denominator. Handle a missing KPI through onboarding.

Name the monetary endpoint precisely: incremental contribution, avoidable spend, or the value of usable capacity. Identify the assumption most likely to break the link. For example, a payment-method switch can leave total orders unchanged. Give the PM one focused opportunity to confirm or correct the proposed explanation. Treat an existing confirmation of the same path as sufficient. Once agreed, express the path as a formula in words with units before estimating the size of its inputs. Carry the confirmed path into the final summary so a new reader can follow the calculation. If several paths share one outcome, count it once.

## 2. Estimate each KPI change independently

Query the mapped BI and analytics resources for observed baselines, exposure, segments, and actual outcomes. Use the central reference-value library for economics and delivery rates. Record the exact report or query, date range, unit, denominator, and any missing coverage. If sources disagree, reconcile definitions before combining figures.

Research the web proactively for comparable impact studies and implementation evidence. Search by intervention, metric and population, then vary terms to find independent evidence, conflicting results, or a closer match. Read the original study or technical documentation and inspect its method. Compare credible sources by intervention and control, eligible population, denominator, geography, rollout, and outcome. Distinguish controlled lift from observational association, overall exposure from self-selected adopters, and absolute change from relative lift. Trace syndicated claims to the same underlying study. Cite primary links and explain why the selected reference transfers, what limits it, and which competing estimate you discounted. Stop when another search is unlikely to change the decision. If browsing is restricted or no credible match emerges, state the limitation and use an analogy, Fermi estimate, or break-even threshold. Keep external benchmarks separate from company actuals.

Choose a method that fits the evidence:

- Reference case: use an observed effect and adjust for differences in population or rollout.
- Analogy: identify a comparable workflow and explain which differences change the estimate.
- Interpolation: estimate between two observed points when the relationship between them is plausible.
- Fermi estimate: decompose an unknown into a few quantities people can observe or reasonably estimate.

Show the independent estimate and its derivation before asking for the PM's estimate. If their number arrived upfront, set it aside while constructing a separate evidence-based calculation and disclose that you have seen it. Compare the two if available. An explicit acceptance of the independent estimate completes the comparison; continue without requesting the same judgment again. Identify assumptions responsible for differences and retain unresolved alternatives as scenarios. Avoid averaging incompatible assumptions.

## 3. Turn the benefit into money

Use the first 12 months from project start unless the user chooses another window. Apply the launch date, adoption ramp, and actual eligible volume within that window. Show the symbolic formula, substituted numbers with units, and result. Distinguish percentage-point change from relative lift. Apply adoption once, at the level on which the effect was estimated.

- Revenue growth: calculate incremental volume and revenue, then contribution after incremental variable costs. If the margin is unavailable, report revenue upside and use the break-even calculation to show how much contribution is needed. Ask for a value or offer an alternate calculation only when that would change the decision.
- Cost reduction: calculate avoided expenditure against the expected baseline.
- Capacity: calculate hours freed and their value at the relevant rate. Ask how the team can use the hours. Claim cash savings only for spending the business can actually avoid.

Count a single business outcome once, even if several KPIs describe its path. Keep capacity and cash visible separately.

## 4. Estimate effort and cost

Apply the same independent-first process as for benefits. Before asking the PM to choose a technical approach, inspect available implementation records and official product or provider documentation. Distinguish documented capability from verified local configuration. Estimate the likely path and flag what would trigger re-estimation. Use comparable work or estimate by role and task. Convert elapsed time to person-hours using staffing and allocation. Calculate delivery cost and incremental running costs for the same horizon. Identify any costs already deducted in the contribution calculation. Show the formula and figures, then compare with the team's estimate if available. Revisit scope, rollout, and benefit timing when the effort estimate changes them.

## 5. Summarize the decision

When the benefit basis and costs support it, lead with first-year net value and ROI, labeled by benefit type. When only gross margin or another partial basis is known, lead with investment and the break-even threshold. Show any provisional ROI as a conditional scenario and identify the missing costs. Carry material effort and benefit ranges into the decision summary. Underneath, show the KPI change, gross benefit, investment, formulas, input sources, and assumptions. Round outputs to match the evidence.

- Net value = incremental benefit − incremental cost.
- ROI = net value ÷ incremental cost × 100%. With zero cost, report net value and mark ROI undefined.
- Payback = earliest point from project start when cumulative benefits cover cumulative costs. State when it falls outside the modeled period or when timing is unknown.
- Break-even = KPI movement required to cover costs. Solve the model backward for the input most likely to change the decision. Compare it with the plausible range, and identify one practical way to check it.

For a range, compute each scenario using a consistent set of inputs. Identify which assumptions drive the difference. If evidence is missing, show the calculation you can support and ask for what would complete it.

For sample calculations, see [worked examples](references/worked-examples.md).
