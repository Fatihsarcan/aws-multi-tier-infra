markdown# 🚀 AWS Multi-Tier Infrastructure with Terraform

Production-ready, highly available AWS infrastructure built with Terraform.

## 📐 Architecture
Internet
↓
Route 53 / ALB (Public Subnet)
↓
EC2 Auto Scaling Group (Private Subnet)
↙        ↘
AZ-a      AZ-b
↓
RDS MySQL Multi-AZ (Private Subnet)

## ✅ Features

- **VPC** with public and private subnets across 2 Availability Zones
- **Application Load Balancer** for traffic distribution
- **Auto Scaling Group** (min: 2, max: 4 EC2 instances)
- **RDS MySQL Multi-AZ** for high availability database
- **NAT Gateway** for secure outbound internet access
- **CloudWatch Alarms** for CPU and error monitoring
- **SNS Notifications** for real-time alerts
- **IAM** least privilege security

## 🛠️ Tech Stack

- AWS (VPC, EC2, ALB, ASG, RDS, CloudWatch, SNS)
- Terraform (Infrastructure as Code)
- Amazon Linux 2023
- MySQL 8.0

## 📁 Project Structure
aws-multi-tier-infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
├── networking/
├── compute/
└── database/

## 🚀 Deploy

```bash
terraform init
terraform plan
terraform apply
```

## 🗑️ Destroy

```bash
terraform destroy
```

## 📊 Monitoring

CloudWatch alarms configured for:
- EC2 CPU > 80% → SNS alert
- EC2 CPU < 20% → SNS alert  
- ALB 5XX errors > 10 → SNS alert
<img width="1913" height="979" alt="Ekran görüntüsü 2026-05-23 152531" src="https://github.com/user-attachments/assets/3e4d5be6-48fd-4097-b3fc-b6e9afb0fd2f" />

<img width="1896" height="942" alt="Ekran görüntüsü 2026-05-23 152538" src="https://github.com/user-attachments/assets/51f5e656-5208-477b-bb41-d8b6f7b2b82a" />
![Uploading Ekran görüntüsü 2026-05-23 152531.png…]()
