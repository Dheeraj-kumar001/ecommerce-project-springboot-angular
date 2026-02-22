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
In this project, an IAM User was created to securely manage programmatic access to AWS resources required for provisioning and managing the EKS cluster.
## Required policies like:
- AmazonEKSClusterPolicy
- AmazonEKSWorkerNodePolicy
- AmazonEC2FullAccess (if needed)
- AmazonEBSCSIDriverPolicy
- AWSLoadBalancerControllerIAMPolicy
- elasticloadbalancing:DescribeListenerAttribute
- 
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/41eee5e7-4462-4ee9-8535-e1dff5fea839" />
Created an access key to enable programmatic access for AWS CLI and Terraform to provision and manage the EKS cluster.
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/22082ca1-2e14-4cd3-a4b9-4b957dd91ecd" />
AWS CloudFormation was used to provision the EKS cluster infrastructure in an automated and repeatable manner.
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/58059642-02b8-46f9-be8f-1e52cdbfb387" />
The Load Balancer distributes incoming traffic across Kubernetes pods and continuously monitors their health status.
## Traffic Flow (Ingress + ALB Workflow)
- User sends request to ALB DNS endpoint
- ALB receives the request
- Listener rules (based on host/path) evaluate the request
- Traffic is forwarded to the Target Group
- Target Group routes traffic to healthy Kubernetes pods
- Health checks continuously monitor pod status
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/dea13b6d-ff65-4aac-862c-2dffd401621a" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d831feee-0048-451c-a7ea-9838bbe570a5" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b6bcd90f-f106-454a-8a73-51705fc186f6" /> 
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/528c6af8-f4e2-4c60-8cb5-79b81d3d009b" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f5eb3982-16ee-49d7-a8ee-4d86e6b0d277" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d9cf1297-4e76-4ad2-8f8d-506082c3c805" />





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
