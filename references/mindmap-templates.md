# Execution Mind Map & Boundary Gate Templates

Use these compact structures to lock scope and select the strongest test environment before calling search, read, or edit tools.

## 1. Standard Execution Mind Map Template

Emit this brief blueprint right after Pass 1 & Pass 2 prompt triage:

```text
[Objective]: <Single imperative sentence stating the core outcome + how it runs in this project>
├── Direct Requirements
│   ├── <Explicit requirement 1>
│   └── <Explicit requirement 2>
├── Holistic Must-Haves (Inside Target Scope)
│   ├── <Owning boundary change>
│   └── <Cohesive consumer / layout / state adjustment>
├── Target Scope (Allowed Files & Symbols)
│   └── <path/to/file.ext#SymbolName>
├── Hardest Test Environment (3+ Passes on Target Scope)
│   ├── <Selected Runner / Analyzer from tool-routing-matrix.md>
│   └── <Scenario Matrix: happy path + boundary + malformed + concurrency (20-100+ cases)>
└── Hard Boundary (Do Not Read or Touch)
    └── <Adjacent modules, sibling routes, unrelated configs>
```

## 2. Filled Mind Map Examples

### Example A: UI Theme Change

```text
[Objective]: Convert the Customer Portal layout and theme tokens to a cohesive white theme in a Next.js + Tailwind app.
├── Direct Requirements
│   └── Switch portal theme to white.
├── Holistic Must-Haves (Inside Target Scope)
│   ├── Surface hierarchy: page background (#FFFFFF), secondary panels (#F8FAFC), elevated cards (#FFFFFF + #E2E8F0 border).
│   ├── Typography contrast: primary text (#0F172A), secondary text (#475569), muted labels (#64748B).
│   └── Component harmony: update button contrast, input borders, table row hover states, and shadow opacity for light backgrounds.
├── Target Scope (Allowed Files & Symbols)
│   └── src/styles/theme.css, src/components/portal/PortalLayout.tsx
├── Hardest Test Environment (3+ Passes on Target Scope)
│   ├── Playwright + axe-core + Stylelint
│   └── 48-case visual & WCAG contrast matrix across breakpoints, hover/focus/disabled states, and empty/populated cards (3 passes)
└── Hard Boundary (Do Not Read or Touch)
    └── src/api/*, src/auth/*, AdminDashboard, routing logic
```

### Example B: Backend Feature

```text
[Objective]: Add rate-limit retry backoff to `StripeWebhookClient.sendEvent` in a Node.js TypeScript service.
├── Direct Requirements
│   └── Retry on HTTP 429 in `StripeWebhookClient.sendEvent`.
├── Holistic Must-Haves (Inside Target Scope)
│   ├── Respect `Retry-After` header (seconds and HTTP-date); fall back to bounded exponential backoff with jitter.
│   ├── Honour caller cancellation (`AbortSignal`) during backoff sleep.
│   └── Preserve original error metadata when max retries are exhausted.
├── Target Scope (Allowed Files & Symbols)
│   └── src/integrations/stripe/webhook-client.ts, tests/stripe/webhook-client.test.ts
├── Hardest Test Environment (3+ Passes on Target Scope)
│   ├── Vitest + typescript-language-server (tsc --noEmit) + WireMock/mock server
│   └── 90 parameterized scenarios: Retry-After formats, malformed headers, 429->200 recovery, 429 exhaustion, concurrent aborts, 5xx vs 4xx non-retryable codes (3 passes)
└── Hard Boundary (Do Not Read or Touch)
    └── src/integrations/paypal/*, billing database models, webhook controller routes
```

## 3. Fail-Closed Boundary Gate Template

When Task A cannot be completed cleanly without reading or editing an out-of-scope file (Area B), stop and ask the user:

```markdown
**Scope Boundary Check**
- **Current Target (Area A)**: `<file or symbol being worked on>`
- **Out-of-Scope Dependency (Area B)**: `<external file or module needed>`
- **Why It Is Needed**: <1-2 sentences explaining the concrete contract mismatch or failure if Area B is not read/updated>
- **Proposed Minimal Action**: <Read-only inspection | Specific 1-function update in Area B>

Should I proceed with inspecting/updating `<Area B>`, or keep the change strictly inside `<Area A>`?
```

## 4. Mandatory Closing Line Template

At the very end of every coding/testing response in the terminal or chat box, include:

```markdown
Bạn có muốn tôi kiểm luôn các file còn lại không?
```
