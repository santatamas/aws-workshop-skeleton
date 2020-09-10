---
title: "Components (Sample)"
chapter: false
weight: 1
---

//TODO: insert infrastructure diagram

The environment will be deployed to a custom [VPC](https://aws.amazon.com/vpc/), thus it will be completely isolated from the rest of the cloud. [Security](https://wa.aws.amazon.com/wat.pillar.security.en.html) is our number 1 concern, and during this workshop we will follow security best practices to build a secure and reliable cloud infrastructure.

The architecture will support HA 
(High Availability) application servers, with a managed database backend using [DocumentDB](https://aws.amazon.com/documentdb/). The infrastructure will have a single entrypoint, using an [ALB](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html).


## VPC & Networking
The infrastructure contains a single VPC, and spans across 2 AZs (Availability Zone). The VPC contains a public, and a private subnet for each AZ. The public subnet is used by the application servers, while the private subnet is used by the database to isolate it from the public internet.

We will use [Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html) and [NACLs](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html) to control network traffic to, and from the subnets.

## Load Balancing
The only way to access our infrastructure is through the Application Load Balancer. The ALB will do Layer7 (HTTP) request routing and load balancing across the Availability Zones. It will also do health checks on the EC2 instances, and will stop routing traffic to unhealthy instances.

## Autoscaling group & EC2 instances
The [EC2](https://aws.amazon.com/ec2/) instances belong to an [ASG](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html). The Autoscaling Group is responsible for making sure that we have the desired number of instances running at all time. It can also monitor EC2 metrics (like CPU usage), and spin up additional resources if needed.

## Database
For the NOSQL backend we use [DocumentDB](https://aws.amazon.com/documentdb/), which is a managed database service. It means that we don't have to worry about server provisioning, OS patches and upgrades, or database version upgrades. It provides us a highly reliable and highly available database engine.