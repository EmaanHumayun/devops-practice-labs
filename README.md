# DevOps & Cloud Infrastructure Practice Labs

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![DevOps Modules](https://img.shields.io/badge/Modules-8%20Complete-emerald)](#curriculum-matrix)
[![IaC Driven](https://img.shields.io/badge/IaC-Terraform%20%26%20K8s-blue)](#)

A structured, production-grade hands-on repository containing practical engineering labs, infrastructure challenges, and automated scripts across the modern DevOps lifecycle.

---

## 📚 Curriculum Matrix

| Module | Core Technology | Key Focus Areas | Status |
| :--- | :--- | :--- | :--- |
| **[Module 01: Linux & Automation](./module-01-linux-automation/)** | Bash, Systemd, Cron | Server automation, log rotation, automated backup daemons | `Completed` |
| **[Module 02: Containerization](./module-02-docker-containerization/)** | Docker, Multi-Stage | Distroless images, layer caching, Docker Compose networking | `Completed` |
| **[Module 03: Kubernetes Orchestration](./module-03-kubernetes-orchestration/)** | Kubernetes v1.30+ | Zero-downtime rollouts, Ingress, HPA, ConfigMaps, PV/PVC | `Completed` |
| **[Module 04: Helm Packaging](./module-04-helm-charts/)** | Helm v3 | Templatized app charts, environment values (`dev`/`prod`) | `Completed` |
| **[Module 05: Infrastructure as Code](./module-05-terraform-opentofu-iac/)** | Terraform, OpenTofu | Multi-AZ VPC, security groups, remote S3 state + locking | `Completed` |
| **[Module 06: CI/CD Delivery](./module-06-cicd-github-actions/)** | GitHub Actions | Automated linting, unit tests, Trivy vulnerability gating | `Completed` |
| **[Module 07: GitOps & CD](./module-07-gitops-argocd/)** | ArgoCD | Declarative GitOps reconciliation, self-healing sync | `Completed` |
| **[Module 08: Observability](./module-08-observability-monitoring/)** | Prometheus, Grafana | Metric scraping, Alertmanager rules, SLO/SLA dashboards | `Completed` |

---

## 🛠️ Lab Directory Structure

```text
devops-practice-labs/
├── module-01-linux-automation/
│   ├── scripts/
│   │   ├── backup-and-rotate.sh
│   │   └── health-check.sh
│   └── README.md
├── module-02-docker-containerization/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── README.md
├── module-03-kubernetes-orchestration/
│   ├── manifests/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   ├── ingress.yaml
│   │   └── hpa.yaml
│   └── README.md
├── module-04-helm-charts/
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── values-prod.yaml
│   └── README.md
├── module-05-terraform-opentofu-iac/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
├── module-06-cicd-github-actions/
│   ├── .github/workflows/ci-pipeline.yml
│   └── README.md
├── module-07-gitops-argocd/
│   ├── application.yaml
│   └── README.md
└── module-08-observability-monitoring/
    ├── prometheus.yml
    ├── alerts.yml
    └── README.md
```

---

## 🚀 How to Execute & Verify Labs

Each module includes standalone instructions and verification commands.

### Example: Running Linux Health Daemon
```bash
cd module-01-linux-automation/scripts
chmod +x health-check.sh
./health-check.sh --verbose
```

### Example: Running Terraform Plan
```bash
cd module-05-terraform-opentofu-iac
terraform init
terraform plan -out=tfplan
```

### Example: Deploying to Kubernetes Cluster
```bash
cd module-03-kubernetes-orchestration
kubectl apply -f manifests/
kubectl get pods -l app=production-service -w
```

---

## 👤 Author

**Emaan Humayun**
- GitHub: [@EmaanHumayun](https://github.com/EmaanHumayun)
- LinkedIn: [Emaan Humayun](https://linkedin.com/in/www.linkedin.com/in/emaanmuhammadhumayun)
- Email: [emaanhumayun23072@gmail.com](mailto:emaanhumayun23072@gmail.com)

