# Module 03: Kubernetes Manifests & Pod Lifecycle

## Objective
Deploy declarative, resilient workloads to Kubernetes clusters using production-grade configurations:
- Rolling updates with `maxSurge` and `maxUnavailable` controls.
- Liveness and readiness HTTP probes for automatic self-healing.
- Decoupled application configuration via ConfigMaps and Secrets.
- Resource request and limit bounds to prevent noisy neighbor starvation.

## Manifests
- `manifests/deployment.yaml`: Declarative Deployment with probes and securityContext.
- `manifests/service.yaml`: Internal ClusterIP routing traffic to active pods.
- `manifests/configmap.yaml`: Decoupled runtime configuration parameters.

## Apply Manifests
```bash
kubectl apply -f manifests/configmap.yaml
kubectl apply -f manifests/deployment.yaml
kubectl apply -f manifests/service.yaml

# Verify rollout status
kubectl rollout status deployment/cloud-native-app-deployment
```
