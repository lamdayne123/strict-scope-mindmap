# Filtered Tool, CLI & MCP Plugin Routing Matrix

Use this curated catalog to select the **most targeted lookup tool** during implementation and the **strongest, hardest verification environment** during the 3-Pass Testing phase. Do not load or invoke tools unrelated to the project's stack.

*(Filtered from the master ecosystem table: generic team-chat/ticket/marketing tools that do not assist targeted code execution or verification are excluded so the agent stays fast and focused.)*

## 1. Targeted Code Intelligence & AST Lookup (Use Instead of Repo Sweeps)

| Stack / Need | Preferred Tool / Plugin | High-Precision Usage Rule |
| --- | --- | --- |
| **Fast Symbol & Definition Lookup** | `LSP` (`typescript-language-server`, `Pyright`, `gopls`, `rust-analyzer`, `jdtls`, `clangd`), `SCIP / ctags` | Jump directly to the owning symbol and its direct references without reading unrelated files |
| **Structural AST Search** | `Tree-sitter`, `ast-grep` | Match exact syntax nodes (functions, hooks, classes, routes) inside `Target Scope` |
| **Exact Text / Pattern Search** | `ripgrep (rg)` | Scope searches to target directories/globs (`rg pattern path/to/target`) |
| **Multi-Repo / Large Index** | `Sourcegraph`, `Zoekt / OpenGrok`, `Gitingest` | Query indexed symbols only when the target contract crosses repository boundaries |
| **Static Quality & Pattern Guards** | `Semgrep`, `CodeQL`, `SonarQube` | Run targeted rule checks on modified files to catch bugs and security flaws early |

## 2. High-Rigor Test Harnesses & Stress Engines (For the 3-Pass Test Loop)

| Stack / Domain | Primary Test Runner | Hardest Stress / Fuzz / Contract Companion |
| --- | --- | --- |
| **JavaScript / TypeScript** | `Vitest`, `Jest` | `Testing Library` (component behavior), `Playwright Test` (E2E), `Benchmark.js` |
| **Python** | `pytest` | `Pyright` (strict types), `Schemathesis` (API schema fuzzing), `pytest-benchmark`, `Memray` / `Scalene` |
| **Go** | `Go test` (`go test -race -count=3`) | Built-in fuzzing (`go test -fuzz`), `Hyperfine` |
| **Rust** | `cargo test` | `Criterion` (benchmarks), `rust-analyzer` diagnostics |
| **Java / JVM** | `JUnit / TestNG`, `Maven Surefire / Failsafe`, `Gradle Test` | `JMH` (microbenchmarks), `async-profiler` / `VisualVM` |
| **C / C++** | `GoogleTest / Catch2` | `clangd`, `GDB / LLDB`, `Valgrind / Heaptrack / perf` |
| **PHP** | `PHPUnit / Pest` | Static analysis + isolated functional suites |
| **API & Contract Testing** | `Newman / Postman CLI`, `Bruno`, `Insomnia` | `Schemathesis` (property-based OpenAPI testing), `Pact` (contract testing), `WireMock / MockServer`, `Spectral` |
| **Load & Concurrency Stress** | `k6`, `Locust`, `Gatling`, `autocannon`, `JMeter` | Use against local/sandboxed endpoints when the target feature is latency- or concurrency-critical |

## 3. Browser, UI, Styling & Accessibility Verification

| Verification Goal | Preferred Tool / Plugin | What to Verify on Target UI |
| --- | --- | --- |
| **Real Browser E2E & Computed Styles** | `Playwright`, `Puppeteer`, `Cypress`, `Selenium`, `WebdriverIO` | Verify rendered DOM, computed theme colors/contrast, responsive breakpoints, and interactive states across 3 passes |
| **Runtime DOM, Console & Network** | `Chrome DevTools Protocol` | Confirm zero console errors, zero failed network requests, and clean layout metrics |
| **Component Isolation & Visual Diff** | `Storybook`, `Chromatic`, `Percy / Applitools` | Verify light/dark theme harmony and component states in isolation |
| **Accessibility & Web Quality** | `axe-core / Pa11y`, `Lighthouse`, `WebPageTest` | Enforce contrast ratios (critical when changing themes), ARIA roles, and focus traps |
| **Design Token Alignment** | `Figma MCP / API`, `Penpot API`, `Stylelint`, `Tailwind CSS tooling`, `ESLint / Prettier` | Match spacing, typography, and color tokens cleanly |

## 4. Database, Backend, Schema & Cloud Sandboxes

| Layer | Preferred Tool / Plugin | Target-Scoped Verification Use |
| --- | --- | --- |
| **Relational & Serverless DBs** | `PostgreSQL client / MCP`, `Neon`, `Supabase`, `MySQL / MariaDB client`, `SQLite CLI` | Verify schema migrations, constraints, index plans (`EXPLAIN`), and round-trip queries |
| **NoSQL, Cache & Search** | `MongoDB driver / MCP`, `Redis CLI / client`, `Meilisearch / Typesense / Elasticsearch` | Verify TTLs, key eviction, index mappings, and query filters |
| **ORM & Migrations** | `Prisma / Drizzle`, `TypeORM / SQLAlchemy`, `Alembic`, `Flyway / Liquibase`, `dbt` | Validate forward/backward migration integrity on the target model |
| **Data & Schema Validation** | `Zod / Valibot / Pydantic`, `JSON Schema / Ajv`, `Marshmallow`, `Protobuf / Avro / Buf`, `Great Expectations / Pandera` | Fuzz-test boundary and malformed payloads across dozens of inputs |
| **Backend Runtimes & Queues** | `FastAPI / Django`, `Express / NestJS`, `Spring Boot`, `ASP.NET Core`, `Laravel / Symfony`, `Gin / Echo`, `Axum / Actix Web`, `gRPC`, `GraphQL / Apollo`, `RabbitMQ / Kafka / NATS`, `Temporal`, `BullMQ / Celery` | Test handler contracts, idempotency, retries, and error serialization |
| **Reproducible Containers & Sandboxes** | `Docker / Docker Compose`, `Kubernetes / Helm`, `Stripe test mode / PayPal sandbox / SePay API sandbox`, `Mailpit / MailHog`, `MinIO` | Spin up isolated local dependencies for high-rigor testing without touching production |

## 5. Security, Binary Analysis & Reverse Engineering

| Domain | Preferred Tool / Plugin | Target-Scoped Verification Use |
| --- | --- | --- |
| **Code & Secret Scanning** | `Semgrep / CodeQL`, `Bandit / Brakeman`, `Gitleaks / TruffleHog`, `Checkov / KICS`, `Open Policy Agent / Conftest` | Scan modified files/configs for injection, auth bypass, or leaked secrets |
| **Dependency & Artifact Integrity** | `Snyk / OSV-Scanner`, `Trivy / Grype`, `OWASP Dependency-Check`, `Syft`, `Sigstore / Cosign` | Verify newly added or updated dependencies |
| **Web Security Probing (Authorized)** | `OWASP ZAP`, `Nuclei` | Run targeted templates against local test endpoints |
| **Reverse Engineering & Binary Inspection** | `REA`, `Ghidra / IDA`, `Binary Ninja / radare2 / Rizin`, `CFR / Vineflower`, `JADX / apktool`, `.NET ILSpy / dnSpyEx`, `Frida`, `Wireshark / mitmproxy`, `Binwalk / Detect It Easy` | Inspect compiled artifacts, bytecode (`javap`), or protocol captures with evidence provenance |

## 6. Specialized Domains (Mobile, Game Dev, AI, Blockchain, Embedded)

| Domain | Preferred Tool / Plugin | High-Rigor Testing & Scope Integration |
| --- | --- | --- |
| **Minecraft & Game Dev** | `Paper / Purpur API`, `Sponge API`, `Fabric Loom / NeoForge`, `Geyser tooling`, `Unity CLI / Unity MCP`, `Unreal Automation Tool`, `Godot CLI`, `RenderDoc / Nsight / PIX` | Pair with `minecraft-plugin-dev` when applicable; test event listeners, tick budget, async safety, and packet/command edge cases |
| **Mobile (Android / iOS / Cross)** | `Android SDK / adb / Gradle`, `Xcodebuild`, `Flutter / Dart CLI`, `Maestro / Appium`, `Detox`, `SwiftLint / SwiftFormat`, `Firebase Test Lab` | Verify UI lifecycle, permissions, and state restoration on target screens |
| **Data, ML & LLM Evaluation** | `DuckDB / Apache Spark`, `pandas / Polars`, `Ragas / promptfoo / DeepEval`, `MLflow / Weights & Biases` | Run evaluation matrices and data-quality assertions (`Pandera`) |
| **Blockchain & Smart Contracts** | `Foundry / Hardhat`, `Slither / Mythril / Solhint` | Run Foundry fuzz/invariant tests (`forge test --fuzz-runs 500`) and static reentrancy checks |
| **Embedded, Robotics & FPGA** | `PlatformIO / Zephyr / ESP-IDF`, `OpenOCD / J-Link`, `ROS 2 CLI / Gazebo`, `Verilator / Yosys / Icarus Verilog / Verible` | Simulate hardware/HDL testbenches across boundary signal traces |
| **Source Control & Diff Gate** | `Git CLI`, `GitHub MCP`, `GitHub CLI (gh)`, `GitLab CLI (glab)`, `Context7`, `MDN`, `OpenAPI / Swagger` | Check `git diff` / `git status` before finishing to prove zero out-of-scope file modifications |
