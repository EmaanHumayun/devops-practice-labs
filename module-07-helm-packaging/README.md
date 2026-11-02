# Module 07: Helm Chart Packaging & Templating

## Objective
Standardize Kubernetes workload deployment across environments (Dev, Staging, Production) using Helm v3 parameterization.

## Chart Structure
- `chart/Chart.yaml`: Chart metadata and semantic versioning.
- `chart/values.yaml`: Configurable deployment parameters (replicas, resources, image tags).

## Lint & Package
```bash
helm lint ./chart
helm template test-release ./chart
```
