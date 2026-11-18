# Plugin: strict-scope-minecraft

Minecraft server plugin and mod development, Folia regionized concurrency testing, and tick-budget profiling.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `Paper / Purpur API` | High-performance Minecraft server plugin APIs (Event, Command, Adventure, PDC) |
| `Folia API` | Regionized multithreaded scheduling and thread-safety verification |
| `Sponge API` | Cross-platform plugin architecture |
| `Fabric Loom / NeoForge` | Minecraft client/server mod toolchains and Mixin verification |
| `Geyser tooling / Bedrock tooling` | Java-to-Bedrock protocol translation compatibility |
| `Gradle / Maven + JUnit 5 + MockBukkit` | Automated plugin lifecycle, command, and event listener testing |
| `JMH / async-profiler / Spark / VisualVM` | Tick duration (<50ms budget), GC pressure, and memory leak profiling |
| `jdtls` | Java Language Server diagnostics and type checking |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
