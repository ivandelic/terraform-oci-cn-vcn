variable "compartment_ocid" {
  description = "OCID of a compartment where VCN is going to be placed."
  type = string
}

variable "name" {
  description = "Name of the Virtual Cloud Network. The name will be reused to create Internet Gateway, NAT Gateway, Service Gateway, and Local Peering Gateway."
  type = string
}

variable "vcn_cidr" {
  description = "IPv4 CIDR block for the VCN. The allowable VCN size range is /16 to /30. Example: 10.0.0.0/16"
  type = string
}

variable "vcn_subnets" {
  description = "A complex object for declaring subnets, associated route tables, and security lists. Please check examples."
  default = null
  type    = map(object({
    cidr_block = string
    is_public  = bool
    rt_rules   = optional(list(object({
      description         = string
      destination         = string
      destination_type    = string
      network_entity_type = string
      network_entity_id   = optional(string)
    })))
    sl_rules = object({
      egress_security_rules = optional(list(object({
        destination      = string
        protocol         = string
        description      = optional(string)
        destination_type = optional(string)
        stateless        = optional(bool)
        tcp_options      = optional(object({
          min = optional(number)
          max = optional(number)
          source_port_range = optional(object({
            min = number
            max = number
          }))
        }))
        udp_options = optional(object({
          min = number
          max = number
        }))
        icmp_options = optional(object({
          type = number
          code = optional(number)
        }))
      })))
      ingress_security_rules = optional(list(object({
        source      = string
        protocol    = string
        description = optional(string)
        source_type = optional(string)
        stateless   = optional(bool)
        tcp_options      = optional(object({
          min = optional(number)
          max = optional(number)
          source_port_range = optional(object({
            min = number
            max = number
          }))
        }))
        udp_options = optional(object({
          min = number
          max = number
        }))
        icmp_options = optional(object({
          type = number
          code = optional(number)
        }))
      })))
    })
  }))
}

variable "vcn_lpgs" {
  description = "A complex object for declaring Local Peering Gateways. Please check examples."
  default = null
  type    = map(object({
    peer_id = optional(string)
    route_table_id = optional(string)
  }))
}

variable "vcn_drg_attachments" {
  description = "A complex object for declaring Dynamic Peering Gateways to attach within VNC."
  default = null
  type    = map(object({
    drg_id = optional(string)
    drg_route_table_id = optional(string)
  }))
}

variable "prefix_resources" {
  description = "Let the terraform prefix all the resources with the acronym. VNC would be prefixed with vcn_, Security List with sl_, and similar for other resources."
  type = bool
  default = true
}

variable "create_internet_gateway" {
  description = "Switch for Internet Gateway creation in VCN. Default is true. Put false if you don't want it to be created."
  type = bool
  default = true
}

variable "create_nat_gateway" {
  description = "Switch for NAT Gateway creation in VCN. Default is true. Put false if you don't want it to be created."
  type = bool
  default = true
}

variable "create_service_gateway" {
  description = "Switch for Service Gateway creation in VCN. Default is true. Put false if you don't want it to be created."
  type = bool
  default = true
}