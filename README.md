# 🚀 AWS Multi-Tier Infrastructure with Terraform

Production-ready, highly available AWS infrastructure built with Terraform.

---

## 📐 Architecture

```mermaid
graph TB
    Internet(["🌐 Internet"])

    subgraph AWS ["☁️ AWS Cloud — eu-central-1"]

        R53["Route 53\nDNS"]

        subgraph VPC ["VPC"]

            subgraph PublicSubnets ["Public Subnets (AZ-a, AZ-b)"]
                ALB["Application\nLoad Balancer"]
                NAT["NAT Gateway"]
            end

            subgraph PrivateSubnets_Compute ["Private Subnets — Compute (AZ-a, AZ-b)"]
                subgraph ASG ["Auto Scaling Group  min:2 · max:4"]
                    EC2a["EC2\nAmazon Linux 2023\n(AZ-a)"]
                    EC2b["EC2\nAmazon Linux 2023\n(AZ-b)"]
                end
            end

            subgraph PrivateSubnets_DB ["Private Subnets — Database (AZ-a, AZ-b)"]
                RDS["RDS MySQL 8.0\nMulti-AZ Standby"]
            end

        end

        subgraph Monitoring ["Monitoring & Alerts"]
            CW["CloudWatch\nAlarms"]
            SNS["SNS\nNotifications"]
        end

        IAM["IAM\nLeast Privilege"]

    end

    Internet --> R53
    R53 --> ALB
    ALB -->|"SG: port 80/443"| EC2a
    ALB -->|"SG: port 80/443"| EC2b
    EC2a -->|"SG: EC2 only"| RDS
    EC2b -->|"SG: EC2 only"| RDS
    EC2a -->|"outbound"| NAT
    EC2b -->|"outbound"| NAT
    NAT --> Internet

    EC2a & EC2b -->|"CPU metrics"| CW
    ALB -->|"5XX errors"| CW
    CW -->|"CPU > 80%\nCPU < 20%\n5XX > 10"| SNS
```

---

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
```
aws-multi-tier-infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── networking/
    ├── compute/
    └── database/
```

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
