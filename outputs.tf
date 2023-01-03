output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "subnets" {
  value = oci_core_subnet.subnet
}