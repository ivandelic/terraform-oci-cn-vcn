output "vcn_id" {
  description = "OCID of created VCN."
  value = oci_core_vcn.vcn.id
}

output "subnets" {
  description = "Array of created subnets."
  value = oci_core_subnet.subnet
}