terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "vcn-for-oke" {
  source           = "ivandelic/cn-vcn/oci"
  version          = "1.0.0"
  compartment_ocid = var.compartment_ocid
  name             = var.name
  vcn_cidr         = var.vcn_cidr
  vcn_subnets      = var.vcn_subnets
}