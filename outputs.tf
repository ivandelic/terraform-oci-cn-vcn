output "vcn_id" {
  description = "OCID of created VCN."
  value = oci_core_vcn.vcn.id
}

output "subnets" {
  description = "Array of created subnets."
  value = oci_core_subnet.subnet
}

output "local_peering_gateways" {
  description = "Array of created Local Peering Gateways."
  value = oci_core_local_peering_gateway.local_peering_gateways
}

output "drg_attachments" {
  description = "Array of created Dynamic Routing Gateways attachments."
  value = oci_core_drg_attachment.drg_attachments
}