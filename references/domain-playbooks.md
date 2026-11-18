# Domain Playbooks: Holistic Completion vs. Half-Baked vs. Scope Creep

Use this reference when classifying `Holistic Must-Haves`, `Hard Boundary`, and the **3-Pass Test Matrix** during Pass 2 of prompt triage. Every engineering change must be complete at its owning boundary and verified across diverse scenarios without bleeding into sibling systems.

## 1. Web, UI, and Design Systems

**Example Prompt**: *"Switch the website theme to white."*

- **Owning Boundary & Holistic Must-Haves**:
  - Update primary, secondary, and elevated surface backgrounds to cohesive light-mode tones (`#FFFFFF`, `#F8FAFC`, `#F1F5F9` rather than flat `#FFFFFF` everywhere).
  - Invert typography hierarchy (headings, body, muted captions) to high-contrast dark tones.
  - Adjust card borders, dividers, shadows, and input field surfaces so layout boundaries remain crisp on a light background.
  - Harmonize interactive states (`hover`, `active`, `focus` rings, badges, and icon strokes) with the white palette.
- **3-Pass High-Rigor Test Matrix**:
  - Run `Playwright` + `axe-core` + `Stylelint` across 50+ component/state combinations (default, hover, focus, disabled, modal overlay, mobile/desktop viewports) over 3 passes to verify zero contrast violations and zero invisible borders.
- **Half-Baked Failure (Too Narrow)**:
  - Changing only `body { background: #fff; }` while leaving light text unreadable and card boundaries invisible.
- **Scope Creep Violation (Too Broad)**:
  - Restructuring navigation menus, changing page copy, or touching API hooks.

## 2. Backend APIs and Microservices

**Example Prompt**: *"Add cursor pagination to `GET /api/v1/transactions`."*

- **Owning Boundary & Holistic Must-Haves**:
  - Parse and validate `cursor` and `limit` query parameters (with safe default and max bounds) on `GET /api/v1/transactions`.
  - Update the owning query method to filter by cursor, order deterministically (`created_at DESC, id DESC`), and fetch `limit + 1` rows.
  - Return the paginated payload alongside `next_cursor` and `has_more`.
- **3-Pass High-Rigor Test Matrix**:
  - Run `pytest` / `Vitest` + `Schemathesis` across 100+ parameterized requests (empty table, 1 row, exact page multiples, invalid/tampered cursors, negative/huge limits, concurrent inserts during pagination) over 3 passes.
- **Half-Baked Failure (Too Narrow)**:
  - Accepting `?cursor=` in the controller but still loading the entire table into memory.
- **Scope Creep Violation (Too Broad)**:
  - Converting `GET /api/v1/users` to cursor pagination or rewriting the DB pool.

## 3. Database Schemas, Migrations, and Models

**Example Prompt**: *"Add an optional `tax_id` field to the `Organization` model."*

- **Owning Boundary & Holistic Must-Haves**:
  - Add the nullable `tax_id` column to the `Organization` schema/entity definition.
  - Generate or author the forward migration file.
  - Update the direct `Organization` DTO/serializer so reads and writes preserve `tax_id`.
- **3-Pass High-Rigor Test Matrix**:
  - Test migration apply/rollback, null vs. populated `tax_id` persistence, Unicode/max-length strings, and serializer output across 40+ cases over 3 passes.
- **Half-Baked Failure (Too Narrow)**:
  - Adding the column to the ORM class without a migration or stripping the field in the serializer.
- **Scope Creep Violation (Too Broad)**:
  - Modifying `User` or `Billing` tables or refactoring historical migrations.

## 4. Bugfixes and Root-Cause Repair

**Example Prompt**: *"Fix the `TypeError: Cannot read properties of undefined (reading 'price')` in `CartSummary` when an item is out of stock."*

- **Owning Boundary & Holistic Must-Haves**:
  - Guard nullish `price` at the owning boundary, render the out-of-stock indicator, and exclude unavailable items from the subtotal calculation.
- **3-Pass High-Rigor Test Matrix**:
  - Run 60+ parameterized cart permutations (all in stock, all out of stock, mixed, `price: 0` free items, `null`/`undefined`/`NaN` prices, high quantities, discount codes) across 3 passes.
- **Half-Baked Failure (Too Narrow)**:
  - Adding `item?.price` so it evaluates to `NaN` in the total price calculation.
- **Scope Creep Violation (Too Broad)**:
  - Rewriting the `Checkout` flow or renaming unrelated helper functions.

## 5. Minecraft Plugins & Game Development (`Paper / Purpur / Folia` / `Unity` / `Godot`)

**Example Prompt**: *"Add a cooldown to the `/heal` command in `HealCommand.java`."*

- **Owning Boundary & Holistic Must-Haves**:
  - Store per-player `UUID` timestamps using monotonic/system time, check remaining cooldown before healing, send a formatted countdown message when on cooldown, and clean up expired entries to prevent memory leaks.
- **3-Pass High-Rigor Test Matrix**:
  - Run `JUnit` + `Gradle Test` across 80+ scenarios (first use, rapid spam clicks, exact millisecond boundary expiry, bypass permission check, player quit/rejoin cleanup, concurrent Folia region execution) over 3 passes.
- **Half-Baked Failure (Too Narrow)**:
  - Storing `Player` objects in a static `HashMap` (causing memory leaks on disconnect) or using global cooldown instead of per-player cooldown.
- **Scope Creep Violation (Too Broad)**:
  - Editing `/feed`, `/teleport`, or unrelated listener classes.
