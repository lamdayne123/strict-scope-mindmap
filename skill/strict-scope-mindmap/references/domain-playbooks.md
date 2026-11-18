# Domain Playbooks: Holistic Completion, Adaptive Testing & Scope Gates

Use this reference when classifying `Holistic Must-Haves`, `Hard Boundary`, and the **Adaptive Future-Proof Test Matrix** during Pass 2 of prompt triage.

## 1. Web, UI, and Design Systems

**Example Prompt**: *"Switch the website theme to white."*

- **Owning Boundary & Holistic Must-Haves**:
  - Update primary, secondary, and elevated surface backgrounds to cohesive light-mode tones (`#FFFFFF`, `#F8FAFC`, `#F1F5F9`).
  - Invert typography hierarchy (headings, body, muted captions) to high-contrast dark tones.
  - Adjust card borders, dividers, shadows, and input surfaces so layout boundaries remain crisp.
  - Harmonize interactive states (`hover`, `active`, `focus` rings, badges, and icons).
- **Adaptive Test Matrix (`plugins/browser-automation`)**:
  - Run `Playwright` + `axe-core` + `Stylelint` across 50+ component/state combinations. If Pass 2 confirms `0` WCAG contrast issues and `0` broken borders across all viewports, stop at Pass 2; if any subtle contrast or dark-mode shadow bleed remains, fix and run Pass 3+.
- **Half-Baked Failure**: Setting only `body { background: #fff; }` while leaving white text unreadable.
- **Scope Creep Violation**: Restructuring navigation menus or touching API hooks.

## 2. Backend APIs and Microservices

**Example Prompt**: *"Add cursor pagination to `GET /api/v1/transactions`."*

- **Owning Boundary & Holistic Must-Haves**:
  - Validate `cursor` and `limit` query params, query deterministically (`created_at DESC, id DESC`) with `limit + 1`, and return `next_cursor` + `has_more`.
- **Adaptive Test Matrix (`plugins/testing` + `plugins/database`)**:
  - Run `pytest` / `Vitest` + `Schemathesis` across 100+ parameterized cases (empty table, duplicate timestamps, tampered cursors, concurrent inserts, 100k-row index plan check for long-term scale).
- **Half-Baked Failure**: Slicing a full table array in memory.
- **Scope Creep Violation**: Refactoring `GET /api/v1/users` or rewriting the ORM layer.

## 3. Database Schemas, Migrations, and Models

**Example Prompt**: *"Add an optional `tax_id` field to the `Organization` model."*

- **Owning Boundary & Holistic Must-Haves**:
  - Update `Organization` schema, generate forward/rollback migration, and update the direct `Organization` DTO/serializer.
- **Adaptive Test Matrix (`plugins/database`)**:
  - Verify migration up/down idempotency, null/populated persistence, Unicode/max-length bounds, and zero lock contention risk on existing rows.
- **Half-Baked Failure**: Updating the model class without a migration.
- **Scope Creep Violation**: Editing `User` or `Billing` tables.

## 4. Bugfixes and Root-Cause Repair

**Example Prompt**: *"Fix `TypeError: Cannot read properties of undefined (reading 'price')` in `CartSummary` when an item is out of stock."*

- **Owning Boundary & Holistic Must-Haves**:
  - Guard nullish `price` at the owning boundary, display out-of-stock state, and exclude unavailable items from subtotal math.
- **Adaptive Test Matrix (`plugins/testing`)**:
  - Run 60+ cart permutations (all out of stock, mixed, `0` price free items, `NaN`/`null`, floating-point precision checks for long-term accounting accuracy).
- **Half-Baked Failure**: Using `item?.price` so subtotal becomes `NaN`.
- **Scope Creep Violation**: Rewriting the `Checkout` module.

## 5. Minecraft Plugins & Game Dev (`plugins/minecraft`)

**Example Prompt**: *"Add a cooldown to `/heal` in `HealCommand.java`."*

- **Owning Boundary & Holistic Must-Haves**:
  - Track per-player `UUID` expiry timestamps, format remaining cooldown message, and evict expired/disconnected entries so long-running servers never leak memory.
- **Adaptive Test Matrix (`plugins/minecraft` + `plugins/testing`)**:
  - Run `JUnit` + `Gradle Test` across 80+ cases including rapid spam, exact-ms boundary, permission bypass, Folia async/region thread safety, and 10,000-player join/quit memory retention check.
- **Half-Baked Failure**: Keeping `Player` references in a static `HashMap` without cleanup (causes severe long-term server OOM).
- **Scope Creep Violation**: Modifying `/feed` or `/spawn`.
