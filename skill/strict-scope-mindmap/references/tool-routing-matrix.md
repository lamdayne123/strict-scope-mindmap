# Filtered Plugin & Tool Routing Matrix

This skill bundles 7 modular plugin manifests under `plugins/`. Select only the plugin and tools that match the target project's stack.

*(Filtered from the master ecosystem table: non-engineering chat/ticket/marketing noise is removed so the agent routes directly to high-signal code intelligence, verification harnesses, and runtime sandboxes.)*

## Plugin 1: `plugins/code-analysis` (Target-Scoped Reading & AST Intelligence)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **Language Servers (LSP)** | `typescript-language-server`, `Pyright`, `gopls`, `rust-analyzer`, `jdtls`, `clangd`, `SCIP / ctags` | Resolve symbol definitions, types, and direct references inside `Target Scope` without reading whole files |
| **AST & Structural Search** | `Tree-sitter`, `ast-grep`, `ripgrep (rg)` | Locate exact syntax nodes, hooks, routes, or patterns inside target directories |
| **Cross-Repo & Architecture** | `Sourcegraph`, `Zoekt / OpenGrok`, `Understand`, `Gitingest` | Inspect cross-module contracts when a target boundary spans packages |
| **Static Quality & Lint** | `Semgrep`, `CodeQL`, `SonarQube`, `ESLint / Prettier`, `Stylelint`, `SwiftLint`, `Yamllint / Taplo`, `Spectral` | Catch structural bugs, type mismatches, and style drift in Pass 1 |
| **Source Control & Diff Gate** | `Git CLI`, `GitHub MCP`, `GitHub CLI (gh)`, `GitLab CLI (glab)` | Verify `git diff` / `git status` contains zero out-of-scope edits |

## Plugin 2: `plugins/testing` (Adaptive Multi-Scenario & Stress Harnesses)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **Unit & Integration Runners** | `Vitest`, `Jest`, `Testing Library`, `pytest`, `Go test`, `cargo test`, `JUnit / TestNG`, `Maven Surefire / Failsafe`, `Gradle Test`, `PHPUnit / Pest`, `GoogleTest / Catch2`, `Flutter / Dart CLI`, `Xcodebuild`, `Qt Test` | Run Pass 1 functional tests and Pass 2+ parameterized scenario tables (`20-100+` cases) |
| **API & Contract Fuzzing** | `Schemathesis`, `Pact`, `Newman / Postman CLI`, `Bruno`, `Insomnia`, `WireMock / MockServer`, `OpenAPI / Swagger` | Property-test REST/GraphQL/gRPC endpoints against malformed and boundary payloads |
| **Load, Benchmark & Profiling** | `k6`, `Locust`, `Gatling`, `autocannon`, `JMeter`, `Hyperfine`, `Benchmark.js`, `Criterion`, `JMH`, `pytest-benchmark`, `Memray / Scalene`, `Valgrind / Heaptrack / perf`, `async-profiler` | Verify Pass 2 long-term performance, latency, and zero memory leaks |
| **Specialized Harnesses** | `Foundry / Hardhat` (Web3), `Ragas / promptfoo / DeepEval` (AI), `Great Expectations / Pandera` (Data), `Verilator / Yosys / Icarus Verilog` (FPGA), `PlatformIO / Zephyr / ESP-IDF` (Embedded) | Run domain-native simulation and fuzz suites |

## Plugin 3: `plugins/browser-automation` (UI, Theme, Accessibility & Visual Verification)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **E2E Browser Engines** | `Playwright`, `Puppeteer`, `Chrome DevTools Protocol`, `Cypress`, `WebdriverIO`, `Selenium` | Inspect live DOM, computed styles, responsive layouts, network calls, and console errors |
| **Visual & Component QA** | `Storybook`, `Chromatic`, `Percy / Applitools` | Verify component states (`hover`, `focus`, `disabled`, `loading`) and light/dark theme harmony |
| **Accessibility & Web Vitals** | `axe-core / Pa11y`, `Lighthouse`, `WebPageTest` | Enforce WCAG contrast ratios and zero layout shift (`CLS`) when modifying UI/themes |
| **Design & Asset Tooling** | `Figma MCP / API`, `Penpot API`, `Tailwind CSS tooling`, `SVGO / Sharp` | Align implementation with design tokens |

## Plugin 4: `plugins/database` (Data Layer, ORM, Migrations & Local Sandboxes)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **Engines & Clients** | `PostgreSQL client / MCP`, `Neon`, `Supabase`, `MySQL / MariaDB client`, `SQLite CLI`, `MongoDB driver / MCP`, `Redis CLI / client`, `DuckDB` | Verify queries, constraints, indexes, transactions, and TTL behavior |
| **ORM & Migration Guards** | `Prisma / Drizzle`, `TypeORM / SQLAlchemy`, `Alembic`, `Flyway / Liquibase`, `dbt` | Test forward/rollback migrations and future schema compatibility |
| **Search & Storage** | `Meilisearch / Typesense / Elasticsearch`, `pgvector / FAISS`, `Chroma / Qdrant / Weaviate / Milvus`, `MinIO` | Verify indexing, vector queries, and object storage contracts |
| **Runtime validation** | `Zod / Valibot / Pydantic`, `JSON Schema / Ajv`, `Marshmallow`, `Protobuf / Avro / Buf` | Enforce strict boundary parsing before database writes |

## Plugin 5: `plugins/security` (Vulnerability, Secret & Policy Gates)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **SAST & Secret Detection** | `Semgrep / CodeQL`, `Bandit / Brakeman`, `Gitleaks / TruffleHog`, `Slither / Mythril / Solhint` | Detect injection, auth flaws, reentrancy, and hardcoded secrets in touched code |
| **SCA, Container & IaC** | `Snyk / OSV-Scanner`, `Trivy / Grype`, `OWASP Dependency-Check`, `Checkov / KICS`, `Syft`, `Sigstore / Cosign` | Verify dependency safety and container/IaC hardening |
| **Dynamic & Policy Verification** | `OWASP ZAP`, `Nuclei`, `Open Policy Agent / Conftest` | Validate auth policies and endpoint security in authorized test environments |

## Plugin 6: `plugins/reverse-engineering` (Binary, Bytecode, APK & Protocol Analysis)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **Orchestration & Native RE** | `REA`, `Ghidra / IDA`, `Binary Ninja / radare2 / Rizin`, `RetDec`, `GDB / LLDB` | Inspect native binaries, symbols, control flow, and crash dumps with evidence provenance |
| **Managed & Mobile Artifacts** | `CFR / Vineflower`, `JADX / apktool`, `Bytecode Viewer`, `.NET ILSpy / dnSpyEx / dotPeek`, `monodis / javap / jclasslib` | Decompile and verify JVM, Android APK/DEX, and .NET assemblies |
| **Dynamic & Protocol Capture** | `Frida`, `Wireshark / mitmproxy`, `Binwalk / Detect It Easy`, `tcpdump` | Trace runtime hooks, network protocols, and firmware images in authorized environments |

## Plugin 7: `plugins/minecraft` (High-Performance Minecraft Server & Mod Tooling)

| Subcategory | Tools Included | When to Route |
| --- | --- | --- |
| **Server & Proxy APIs** | `Paper / Purpur API`, `Folia` (regionized multithreading), `Sponge API`, `Geyser tooling / Bedrock tooling` | Build and test plugins; pair automatically with `minecraft-plugin-dev` skill |
| **Modding & Build** | `Fabric Loom / NeoForge`, `Gradle / Maven`, `JUnit / TestNG`, `jdtls` | Compile, unit-test, and verify mixin/event contracts |
| **Tick & Memory Profiling** | `JMH`, `async-profiler / VisualVM`, `FlameGraph` | Verify zero main-thread blocking, <1ms listener cost, and zero `Player` reference leaks across Pass 1-N |
