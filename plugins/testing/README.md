# Plugin: strict-scope-testing

High-rigor unit, integration, property-based fuzzing, contract, and load-testing harnesses for the Adaptive Verification Loop.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `Vitest / Jest` | JavaScript and TypeScript parameterized test runner |
| `Testing Library` | User-centric UI component behavior testing |
| `Playwright Test` | Cross-browser end-to-end and API test runner |
| `pytest` | Python parameterized and fixture-driven testing |
| `Go test` | Go table-driven testing, race detector (-race), and native fuzzing (-fuzz) |
| `cargo test` | Rust unit, integration, and doc testing |
| `JUnit / TestNG + Maven Surefire / Gradle Test` | JVM unit and integration test suites |
| `PHPUnit / Pest` | PHP automated test suites |
| `GoogleTest / Catch2` | C and C++ unit and boundary test frameworks |
| `Schemathesis` | Property-based OpenAPI/GraphQL schema fuzzing |
| `Pact` | Consumer-driven contract testing |
| `WireMock / MockServer` | Deterministic HTTP/API dependency simulation |
| `Newman / Postman CLI / Bruno` | Automated API collection verification |
| `k6 / Locust / Gatling / autocannon` | Concurrency, throughput, and tail-latency stress testing |
| `Hyperfine / Criterion / JMH / pytest-benchmark` | Microbenchmarking and regression timing |
| `Memray / Scalene / Valgrind / Heaptrack / perf` | Long-term memory leak and CPU profiling |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
