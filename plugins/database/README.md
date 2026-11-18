# Plugin: strict-scope-database

Database clients, MCP connectors, ORM migration verifiers, and schema validators for data integrity and scale.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `PostgreSQL client (psql) / PostgreSQL MCP` | Query execution, EXPLAIN ANALYZE plans, and constraint checks |
| `Neon / Supabase` | Serverless Postgres branching, Auth, and Edge Function sandboxes |
| `MySQL / MariaDB client` | Relational SQL verification |
| `SQLite CLI (sqlite3)` | Fast local relational snapshot and migration testing |
| `MongoDB driver / MCP` | Document schema and aggregation pipeline verification |
| `Redis CLI (redis-cli) / client` | Cache TTL, eviction, and atomic key-value testing |
| `Prisma / Drizzle / TypeORM / SQLAlchemy` | Type-safe ORM schema and query building |
| `Alembic / Flyway / Liquibase` | Forward and rollback schema migration verification |
| `dbt / Great Expectations / Pandera` | Data transformation and data quality assertions |
| `DuckDB` | Analytical SQL and Parquet/CSV verification |
| `Meilisearch / Typesense / Elasticsearch / pgvector / FAISS` | Full-text and vector search indexing |
| `Zod / Valibot / Pydantic / JSON Schema / Ajv` | Strict boundary payload validation |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
