# Worked examples

All inputs below are illustrative. Look up actual inputs for each new estimate.

## Checkout conversion

**Opening hypothesis.** Offer express payment as shoppers enter checkout. We believe checkout completion (C02) will rise because some shoppers who would abandon during manual entry can finish paying. Each recovered purchase adds an order. Its net sales less incremental variable costs contribute to the business. The estimate hinges on recovering lost purchases. Would that explain the value you expect, or would most users simply switch how they pay?

**After confirmation.** Eligible checkout starters × absolute increase in completion × contribution per additional order = incremental contribution, assuming one order per newly converted shopper.

Assume 10,000 eligible checkout starters during the live portion of year one, an independently estimated absolute lift of 2 percentage points, €100 incremental revenue per additional order, and a 40% contribution margin. Delivery costs €4,000 upfront. Assume ten equally productive live months after two months of delivery and zero incremental running costs.

- Incremental orders = 10,000 × 0.02 = 200.
- Incremental revenue = 200 × €100 = €20,000. Incremental contribution = €20,000 × 40% = €8,000.
- Net value = €8,000 − €4,000 = €4,000. ROI = €4,000 ÷ €4,000 = 100%.
- Payback = 2 months to launch + €4,000 ÷ €800 per live month = 7 months from project start.
- Break-even = €4,000 ÷ €40 per order ÷ 10,000 eligible checkouts = 1 percentage point. Check whether the friction being removed can plausibly account for at least 100 recoverable orders.

## Checkout refactor

**Opening hypothesis.** Simplify how engineers change the checkout code. We believe engineering effort per change (O04) will fall because engineers can spend fewer hours tracing dependencies. Across future changes, those hours become available for other work. Their loaded labor cost gives a capacity value. What work could the team take on with the released time?

**After confirmation.** Comparable changes × hours saved per change × loaded cost per hour = value of released capacity. A cash-savings estimate additionally requires a specific expense the business can avoid.

Suppose tracing dependencies takes 4–6 hours per change, and engineering expects the refactor to remove half that work. This yields 2–3 hours saved per change. Compare that independent calculation with the team's own estimate and ask which tasks each includes.

Assume 20 changes per 13 weeks, a two-week implementation, 50 live weeks, 80 hours of effort, and the same €80/hour cost for implementation and released capacity. Use the unrounded values before reporting.

- Year-one capacity released = 50 ÷ 13 × 20 × (2 to 3) ≈ 154–231 hours.
- Capacity value ≈ €12,300–€18,500. Implementation = 80 × €80 = €6,400.
- Net capacity value ≈ €5,900–€12,100. Capacity ROI ≈ 92%–188%.
- With uniformly spaced changes, payback from project start = 2 + 80 ÷ [(20 ÷ 13) × hours saved per change] ≈ 19–28 weeks.
- Break-even = 80 ÷ [(50 ÷ 13) × 20] ≈ 1.04 hours saved per change. Ask where that time would go before presenting a cash impact.
