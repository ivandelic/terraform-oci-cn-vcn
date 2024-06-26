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

module "vcn" {
  source                  = "../../"
  compartment_ocid        = var.compartment_ocid
  name                    = var.vcn_name
  vcn_cidr                = var.vcn_cidr
  vcn_subnets             = var.vcn_subnets
  vcn_lpgs                = var.vcn_lpgs
  vcn_drg_attachments     = var.vcn_drg_attachments
  create_internet_gateway = false
  create_nat_gateway      = false
  create_service_gateway  = true
  prefix_resources        = false
}