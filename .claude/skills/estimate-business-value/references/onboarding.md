# Onboarding a business or client

Run before the first estimate for each organization. On later runs, open its profile and check whether the KPI catalog and source mappings still resolve. A client change starts a separate profile. An explicit request to reconfigure opens only the affected settings.

1. Identify the organization and project. Look for an existing profile, workspace connection registry, approved metric dictionary, BI dashboards, analytics properties, and reference-value library in the authorized scope. Discover which read tools are actually available. Keep client data separate.
2. Present a short proposed setup using what you found. Ask only for unresolved choices, grouped in one message. A first question when nothing is known could be: “Which organization is this for, and where do you keep its KPI definitions and dashboards? A link or export is enough. I can also show you a starter list.”
3. Select one fixed KPI catalog. Prefer the organization's governed list. Record its location, version or retrieval date, and stable IDs or exact names. If none is available, offer the bundled starter for explicit adoption, or let the PM supply their own list. If a catalog only has names, record the agreed unit and denominator before using a metric. Resolve clashes with organization definitions in favor of the governed source.
4. Map sources to their jobs: BI for business actuals, analytics for event funnels and eligibility, finance or the reference library for unit economics and rates, delivery tools for effort and technical context. One source can serve multiple jobs. For each available connector run a minimal scoped read, such as a dashboard metric definition, report metadata, or a small aggregate query. Record the resource, coverage and last successful check. Distinguish verified access, export supplied, missing access and untested links. If a connection is missing, ask for a scoped link, export, or a PM-provided figure when needed. Never request credentials in chat.
5. Capture reporting currency, default period, financial definitions and known exclusions where available. Record permission or scope limits for external research. Use non-confidential descriptions in public searches. Show the proposed profile and ask for corrections or acceptance once. A fixed catalog and an agreed source plan are enough to start, even with missing connectors. An unknown financial input can wait until it matters.

## Reusable profile

Save the accepted profile to the project's established settings location. Where a writable workspace has no convention, use context/business-value/<organization-slug>.md. Store references and definitions there. Keep client-specific information outside the distributable skill. When persistent storage is unavailable, return the profile in chat for reuse. State where it can be recovered.

| Setting | What to record |
| --- | --- |
| Organization and scope | Client, business unit, market or storefront |
| Approved KPI catalog | Source link or path, version/date, selected catalog |
| Metric mappings | KPI ID/name, exact BI metric or analytics event/filter, denominator, time grain |
| Sources | Resource link/identifier, role, authorized scope, access status and date |
| Reference values | Location, currency and basis for margin, unit costs, loaded rates |
| External evidence | Research scope and restrictions |
| Defaults and gaps | Currency, year from project start, outstanding sources or definitions |
