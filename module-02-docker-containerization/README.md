# Module 02: Production Docker & Multi-Stage Builds

## Objective
Package modern applications into secure, lightweight, and deterministic container images adhering to production standards:
- Multi-stage build compilation to eliminate build dependencies from runtime images.
- Non-root user execution (`USER node` / `appuser`) to adhere to least privilege.
- Layer caching optimization to minimize build duration.

## Files
- `Dockerfile`: Optimized multi-stage build template.
- `docker-compose.yml`: Multi-container topology connecting application, database, and cache.

## Build and Run
```bash
docker build -t app:v1.0 .
docker compose up -d
```
