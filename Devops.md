# 🌐 End-to-End E-Commerce Application Deployment on AWS EKS with GitOps and Observability

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b09b6415-a3f8-415a-b001-d01c931cf850" />


## 📌 Project Overview
This project demonstrates the **end-to-end deployment of a 3-tier E-Commerce application** on **AWS Elastic Kubernetes Service (EKS)** using **GitOps principles** with full CI/CD, observability, and security integration.

The application consists of:
- 🎨 **Frontend:** Angular
- ⚙️ **Backend:** Spring Boot
- 🗄️ **Database:** MySQL (StatefulSet with persistent storage)

---

## 🏗️ Architecture Diagram
![Architecture Diagram](./deepseek_mermaid_20250816_946552.png)



---

## 🚀 Tools & Technologies
- ☁️ **Cloud & IaC:** AWS (EKS, VPC, IAM, EBS), Terraform, Ansible
- 📦 **Containerization & Orchestration:** Docker, Kubernetes, Helm
- 🔄 **CI/CD & GitOps:** Jenkins, ArgoCD, GitHub
- 📊 **Monitoring & Observability:** Prometheus, Grafana, EFK (Elasticsearch, Fluentd/Logstash, Kibana), CloudWatch, Slack/Email Alerts
- 🔐 **Security:** RBAC, Network Policies, IAM Roles (IRSA), Trivy (Image Scanning), SonarQube (Code Quality), OWASP Guidelines
- 💻 **Application Stack:** Angular (Frontend), Spring Boot (Backend), MySQL (Database)

---

## ⚙️ Features & Implementation

### 🔹 Infrastructure as Code (IaC)
- 🛠️ Provisioned **AWS EKS Cluster, VPC, Subnets, Security Groups** using Terraform.
- 🔑 Configured IAM roles with **IRSA (IAM Roles for Service Accounts)**.

### 🔹 CI/CD Pipeline
- 🤖 **Jenkins** for CI pipeline: build → test → scan → push images to Amazon ECR.
- 🧹 **SonarQube** integrated for code quality checks.
- 🛡️ **Trivy** for container vulnerability scanning.
- 🚦 **ArgoCD** for GitOps-based CD to deploy applications to EKS.

### 🔹 Application Deployment
- 📜 Used **Helm charts** for frontend, backend, and database Kubernetes manifests.
- 🔗 **Spring Boot backend** connected to **MySQL** using JDBC.
- 💾 Persistent storage using **EBS volumes** with StatefulSets.
- 🌍 Services exposed via **ClusterIP, NodePort, and Ingress (ALB + Nginx)**.

### 🔹 Observability
- 📈 **Prometheus** collects metrics and integrates with **Grafana** dashboards.
- 📑 **EFK Stack (Elasticsearch + Fluentd + Kibana)** for centralized log collection.
- 🔔 **CloudWatch** and **Slack/Email alerts** for proactive monitoring.

### 🔹 Security
- 🛡️ Implemented **RBAC and Network Policies** for access control.
- 🔍 **Trivy** ensures container security with vulnerability scanning.
- 🔐 **IAM roles** for secure service-to-service communication.
- 📜 Followed **OWASP Top 10 guidelines** for application-level security best practices.

### 🔹 Scalability & Reliability
- 📈 **Horizontal Pod Autoscaler (HPA)** for dynamic scaling.
- ♻️ **Zero-downtime deployments** with Kubernetes rolling updates.

---

## 📊 Key Outcomes
- ✅ Fully automated **CI/CD pipeline** with Jenkins + ArgoCD.
- 🔄 **GitOps workflow** for reliable, consistent deployments.
- 📊 **Centralized monitoring and logging** with Prometheus, Grafana, and EFK.
- 🔐 **Enhanced security** with RBAC, IAM roles, OWASP guidelines, vulnerability scans, and code quality checks.
- 🚀 Achieved **scalable, resilient, and production-grade deployment** of a real-world 3-tier application.



## ✨ Conclusion
This project showcases how to design and deploy a **production-ready E-Commerce application** on AWS EKS with **CI/CD, GitOps, observability, and security best practices (including OWASP)**. It highlights end-to-end DevOps skills and cloud-native architecture implementation.
