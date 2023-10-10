# Example 1: VCN for OKE with OCI VNC-Native CNI, Private K8s API Endpoint, Private Worker Nodes, Private Pods and Mixed Load Balancers

## Prerequisites
+ OCI CLI [installed and configured](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm)
+ Terraform [installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-cli)

## Explanation
To describe cloud-native VCN, module [cn-vcn](https://registry.terraform.io/modules/ivandelic/cn-vcn/oci/latest) uses complex variables with the following signature: 
```
name        = ""
vcn_cidr    = ""
vcn_subnets = {
  subnet-name = {
    cidr_block = ""
    is_public  = 
    rt_rules   = [...]
    sl_rules = {
      ingress_security_rules = [...]
      egress_security_rules = [...]
    }
  }
}
```

## Run the Example

### 1. Initialize Terraform
Position terminal in ```oke-native-multiple-subnets``` folder. Initialize Terraform with the following command:
```
terraform init
```

### 2. Execute Apply to Create VCN
Stay in the same folder and execute apply command:
```
terraform apply -var-file=.tfvars
```
Action will create the VCN. Note that apply command passes parameters via the ```-var-file=.tfvars``` flag.

### 3. Finalize
You are now ready to proceed and deploy OKE on top of created VCN.