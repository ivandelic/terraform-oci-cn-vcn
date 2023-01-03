# OCI Cloud Native VCN

OCI Cloud Native VCN is an MVP-like Virtual Cloud Network designed to support cloud-native workloads. It's tailored to support integrated communication for cloud-native components, such as Container Engine for Kubernetes (OKE), Functions, Container Instances, and others.

The module has a flexible nested input variable system designated to create powerful subnetting with routing and security lists. A good example is a network for OKE with multiple subnets for K8s API endpoint, worker nodes, and load balancer.

The module creates the following resources:
+ Single Virtual Cloud Network
+ Multiple Subnets
+ Multiple Route Table
+ Multiple Security List
+ Single Internet Gateway
+ Single NAT Gateway
+ Single Service Gateway
+ Single Local Peering Gateway