# VCN
vcn_name    = "poc-fra-eks-vcn"
vcn_cidr    = "10.81.16.0/20"
vcn_subnets = {
  test-bastion = {
    cidr_block = "10.81.16.8/29"
    is_public  = false
    sl_rules   = {
      egress_security_rules = [
        {
          description = "Allow bastion to access the Kubernetes API endpoint"
          destination = "10.81.16.0/29"
          protocol    = "6"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Allow SSH traffic to worker nodes."
          destination = "10.81.17.0/24"
          protocol    = "6"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          # Optional, delete after pilot.
          description = "Allow SSH traffic to pods nodes."
          destination = "10.81.30.0/24"
          protocol    = "6"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          # Optional, delete after pilot.
          description = "Allow SSH traffic to pods nodes."
          destination = "10.81.25.128/25"
          protocol    = "6"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          # Optional, delete after pilot.
          description = "Allow SSH traffic to pods nodes."
          destination = "10.81.26.0/25"
          protocol    = "6"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          # Optional, delete after pilot.
          description = "Allow SSH traffic to pods nodes."
          destination = "10.81.26.128/25"
          protocol    = "6"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          # Optional, delete after pilot.
          description = "Allow SSH traffic to pods nodes."
          destination = "10.81.27.0/25"
          protocol    = "6"
          tcp_options = {
            min = 22
            max = 22
          }
        }
      ]
    }
  }
  test-k8s-api = {
    cidr_block = "10.81.16.0/29"
    is_public  = false
    rt_rules   = [
      {
        description         = "Traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Kubernetes worker to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.17.0/24"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Kubernetes worker to control plane communication"
          protocol    = "6"
          source      = "10.81.17.0/24"
          tcp_options = {
            min = 12250
            max = 12250
          }
        },
        {
          description  = "Path discovery"
          icmp_options = {
            code = "4"
            type = "3"
          }
          protocol = "1"
          source   = "10.81.17.0/24"
        },
        {
          description = "Pod 1 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.30.0/24"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Pod 1 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.30.0/24"
          tcp_options = {
            min = 12250
            max = 12250
          }
        },
        {
          description = "Pod 2 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.25.128/25"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Pod 2 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.25.128/25"
          tcp_options = {
            min = 12250
            max = 12250
          }
        },
        {
          description = "Pod 3 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.26.0/25"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Pod 3 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.26.0/25"
          tcp_options = {
            min = 12250
            max = 12250
          }
        },
        {
          description = "Pod 4 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.26.128/25"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Pod 4 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.26.128/25"
          tcp_options = {
            min = 12250
            max = 12250
          }
        },
        {
          description = "Pod 5 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.27.0/25"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Pod 5 to Kubernetes API endpoint communication"
          protocol    = "6"
          source      = "10.81.27.0/25"
          tcp_options = {
            min = 12250
            max = 12250
          }
        },
        {
          description = "External access to Kubernetes API endpoint"
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options = {
            min = 6443
            max = 6443
          }
        },
        {
          description = "Bastion Service access to Kubernetes API endpoint"
          protocol    = "6"
          source      = "10.81.16.0/29"
          tcp_options = {
            min = 6443
            max = 6443
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow Kubernetes Control Plane to communicate with OKE"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Allow Kubernetes Control Plane Path Discovery"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol = "1"
          icmp_options     = {
            code = "4"
            type = "3"
          }
        },
        {
          description      = "Allow Kubernetes control plane to communicate with worker nodes."
          destination      = "10.81.17.0/24"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 10250
            max = 10250
          }
        },
        {
          description      = "Path discovery"
          destination      = "10.81.17.0/24"
          destination_type = "CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow Kubernetes API endpoint to communicate with pods 1."
          destination      = "10.81.30.0/24"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow Kubernetes API endpoint to communicate with pods 2."
          destination      = "10.81.25.128/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow Kubernetes API endpoint to communicate with pods 3."
          destination      = "10.81.26.0/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow Kubernetes API endpoint to communicate with pods 4."
          destination      = "10.81.26.128/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow Kubernetes API endpoint to communicate with pods 5."
          destination      = "10.81.27.0/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Bastion Service access to Kubernetes API endpoint"
          protocol         = "6"
          destination_type = "CIDR_BLOCK"
          destination      = "10.81.16.0/29"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        }
      ]
    }
  }
  test-worker-node = {
    cidr_block = "10.81.17.0/24"
    is_public  = false
    rt_rules   = [
      {
        description         = "traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Allow Kubernetes control plane to communicate with worker nodes"
          protocol    = "6"
          source      = "10.81.16.0/29"
          tcp_options = {
            min = 10250
            max = 10250
          }
        },
        {
          description  = "Path discovery"
          icmp_options = {
            code = "4"
            type = "3"
          }
          protocol = "1"
          source   = "0.0.0.0/0"
        },
        {
          description = "Allow inbound SSH traffic to worker nodes."
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          description = "Allow Bastion Service inbound SSH traffic to worker nodes."
          protocol    = "6"
          source      = "10.81.17.0/24"
          tcp_options = {
            min = 22
            max = 22
          }
        },
        {
          description = "Load Balancer 1 to Worker nodes node ports"
          protocol    = "6"
          source      = "10.81.16.32/27"
          tcp_options = {
            min = 30000
            max = 32767
          }
        },
        {
          description = "Allow load balancer 1 to communicate with kube-proxy on worker nodes."
          protocol    = "6"
          source      = "10.81.16.32/27"
          tcp_options = {
            min = 10256
            max = 10256
          }
        },
        {
          description = "Load Balancer 2 to Worker nodes node ports"
          protocol    = "6"
          source      = "10.81.16.64/27"
          tcp_options = {
            min = 30000
            max = 32767
          }
        },
        {
          description = "Allow load balancer 2 to communicate with kube-proxy on worker nodes."
          protocol    = "6"
          source      = "10.81.16.64/27"
          tcp_options = {
            min = 10256
            max = 10256
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow worker nodes to access pods 1."
          destination      = "10.81.30.0/24"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow worker nodes to access pods 2."
          destination      = "10.81.25.128/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow worker nodes to access pods 3."
          destination      = "10.81.26.0/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow worker nodes to access pods 4."
          destination      = "10.81.26.128/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Allow worker nodes to access pods 5."
          destination      = "10.81.27.0/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Path Discovery"
          destination      = "0.0.0.0/0"
          destination_type = "CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow nodes to communicate with OKE"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Kubernetes worker to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        },
        {
          description      = "Kubernetes worker to Kubernetes API endpoint communication."
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 12250
            max = 12250
          }
        },
        {
          description      = "Allow Bastion Service inbound SSH traffic to worker nodes."
          destination      = "10.81.17.0/24"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options = {
            min = 22
            max = 22
          }

        }
      ]
    }
  }
  test-pods-1 = {
    cidr_block = "10.81.30.0/24"
    is_public  = false
    rt_rules   = [
      {
        description         = "traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Allow worker nodes to access pods"
          protocol    = "all"
          source      = "10.81.17.0/24"
        },
        {
          description = "Allow Kubernetes API endpoint to communicate with pods"
          protocol    = "all"
          source      = "10.81.16.0/29"
        },
        {
          description = "Allow pods to communicate with other pods"
          protocol    = "all"
          source      = "10.81.30.0/24"
        },
        {
          description = "Allow bastion to SSH to pods"
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options      = {
            min = 22
            max = 22
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow pods to communicate with other pods"
          destination      = "10.81.30.0/24"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Path Discovery"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow pods to communicate with OCI services"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 12250
            max = 12250
          }
        }
      ]
    }
  }
  test-pods-2 = {
    cidr_block = "10.81.25.128/25"
    is_public  = false
    rt_rules   = [
      {
        description         = "traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Allow worker nodes to access pods"
          protocol    = "all"
          source      = "10.81.17.0/24"
        },
        {
          description = "Allow Kubernetes API endpoint to communicate with pods"
          protocol    = "all"
          source      = "10.81.16.0/29"
        },
        {
          description = "Allow pods to communicate with other pods"
          protocol    = "all"
          source      = "10.81.25.128/25"
        },
        {
          description = "Allow bastion to SSH to pods"
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options      = {
            min = 22
            max = 22
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow pods to communicate with other pods"
          destination      = "10.81.25.128/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Path Discovery"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow pods to communicate with OCI services"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 12250
            max = 12250
          }
        }
      ]
    }
  }
  test-pods-3 = {
    cidr_block = "10.81.26.0/25"
    is_public  = false
    rt_rules   = [
      {
        description         = "traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Allow worker nodes to access pods"
          protocol    = "all"
          source      = "10.81.17.0/24"
        },
        {
          description = "Allow Kubernetes API endpoint to communicate with pods"
          protocol    = "all"
          source      = "10.81.16.0/29"
        },
        {
          description = "Allow pods to communicate with other pods"
          protocol    = "all"
          source      = "10.81.26.0/25"
        },
        {
          description = "Allow bastion to SSH to pods"
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options      = {
            min = 22
            max = 22
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow pods to communicate with other pods"
          destination      = "10.81.26.0/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Path Discovery"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow pods to communicate with OCI services"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 12250
            max = 12250
          }
        }
      ]
    }
  }
  test-pods-4 = {
    cidr_block = "10.81.26.128/25"
    is_public  = false
    rt_rules   = [
      {
        description         = "traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Allow worker nodes to access pods"
          protocol    = "all"
          source      = "10.81.17.0/24"
        },
        {
          description = "Allow Kubernetes API endpoint to communicate with pods"
          protocol    = "all"
          source      = "10.81.16.0/29"
        },
        {
          description = "Allow pods to communicate with other pods"
          protocol    = "all"
          source      = "10.81.26.128/25"
        },
        {
          description = "Allow bastion to SSH to pods"
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options      = {
            min = 22
            max = 22
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow pods to communicate with other pods"
          destination      = "10.81.26.128/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Path Discovery"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow pods to communicate with OCI services"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 12250
            max = 12250
          }
        }
      ]
    }
  }
  test-pods-5 = {
    cidr_block = "10.81.27.0/25"
    is_public  = false
    rt_rules   = [
      {
        description         = "traffic to OCI services"
        destination         = "all-fra-services-in-oracle-services-network"
        destination_type    = "SERVICE_CIDR_BLOCK"
        network_entity_type = "sg"
      }
    ]
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Allow worker nodes to access pods"
          protocol    = "all"
          source      = "10.81.17.0/24"
        },
        {
          description = "Allow Kubernetes API endpoint to communicate with pods"
          protocol    = "all"
          source      = "10.81.16.0/29"
        },
        {
          description = "Allow pods to communicate with other pods"
          protocol    = "all"
          source      = "10.81.27.0/25"
        },
        {
          description = "Allow bastion to SSH to pods"
          protocol    = "6"
          source      = "10.81.16.8/29"
          tcp_options      = {
            min = 22
            max = 22
          }
        }
      ]
      egress_security_rules = [
        {
          description      = "Allow pods to communicate with other pods"
          destination      = "10.81.27.0/25"
          destination_type = "CIDR_BLOCK"
          protocol         = "all"
        },
        {
          description      = "Path Discovery"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          icmp_options     = {
            code = "4"
            type = "3"
          }
          protocol = "1"
        },
        {
          description      = "Allow pods to communicate with OCI services"
          destination      = "all-fra-services-in-oracle-services-network"
          destination_type = "SERVICE_CIDR_BLOCK"
          protocol         = "6"
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 6443
            max = 6443
          }
        },
        {
          description      = "Pod to Kubernetes API endpoint communication"
          destination      = "10.81.16.0/29"
          destination_type = "CIDR_BLOCK"
          protocol         = "6"
          tcp_options      = {
            min = 12250
            max = 12250
          }
        }
      ]
    }
  }
  test-lb-int = {
    cidr_block = "10.81.16.32/27"
    is_public  = false
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Load Balancer listener protocol and port"
          protocol    = "6"
          source      = "0.0.0.0/0"
          source_type = "CIDR_BLOCK"
          tcp_options = {
            max = 443
            min = 443
          }
        }
      ]
      egress_security_rules = [
        {
          description = "Load Balancer to worker nodes node ports"
          destination = "10.81.17.0/24"
          protocol    = "6"
          tcp_options = {
            min = 30000
            max = 32767
          }
        },
        {
          description = "Allow load balancer to communicate with kube-proxy on worker nodes."
          destination = "10.81.17.0/24"
          protocol    = "6"
          tcp_options = {
            min = 10256
            max = 10256
          }
        }
      ]
    }
  }
  test-lb-ext = {
    cidr_block = "10.81.16.64/27"
    is_public  = false
    sl_rules = {
      ingress_security_rules = [
        {
          description = "Load Balancer listener protocol and port"
          protocol    = "6"
          source      = "0.0.0.0/0"
          source_type = "CIDR_BLOCK"
          tcp_options = {
            max = 443
            min = 443
          }
        }
      ]
      egress_security_rules = [
        {
          description = "Load Balancer to worker nodes node ports"
          destination = "10.81.17.0/24"
          protocol    = "6"
          tcp_options = {
            min = 30000
            max = 32767
          }
        },
        {
          description = "Allow load balancer to communicate with kube-proxy on worker nodes."
          destination = "10.81.17.0/24"
          protocol    = "6"
          tcp_options = {
            min = 10256
            max = 10256
          }
        }
      ]
    }
  }
}

vcn_drg_attachments = {
  moneta-onprem = {
    drg_id = "ocid1.drg.oc1.eu-frankfurt-1.aaaaaaaamu6snzq5byfuf5e5nhn4j3sgczod7b6edeuzzy3z42ygxsu7rqha"
  }
}
