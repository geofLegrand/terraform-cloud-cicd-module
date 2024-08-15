locals {
  t      = module.server.server_tag_name
  id     = module.server.server_id
  dns    = module.server.server_dns
  adr_pu = module.server.server_pub_ip
  adr_pr = module.server.server_prv_ip

  s_jenkins = [for e in [for i in range(length(local.adr_pr)) :
    {
      "jenkins_id"       = local.t[i] == local.je_key ? local.id[i] : ""
      "jenkins_url"      = local.t[i] == local.je_key ? "http://${local.dns[i]}:${var.jenkin_port}" : ""
      "jenkins_ip_priv"  = local.t[i] == local.je_key ? local.adr_pr[i] : ""
      "jenkins_ip_pub"   = local.t[i] == local.je_key ? local.adr_pu[i] : ""
      "jenkins_ssh_link" = local.t[i] == local.je_key && var.keyName != "" ? "ssh -i ${var.keyName}.pem  ec2-user@${local.adr_pu[i]}" : ""
    }

  ] : e if e.jenkins_id != ""]


  s_jfrog = [for e in [for i in range(length(local.t)) :
    {
      "jfrog_id"       = local.t[i] == local.jf_key ? local.id[i] : ""
      "jfrog_url"      = local.t[i] == local.jf_key ? "http://${local.dns[i]}:${var.jfrog_port}" : ""
      "jfrog_ip_priv"  = local.t[i] == local.jf_key ? local.adr_pr[i] : ""
      "jfrog_ip_pub"   = local.t[i] == local.jf_key ? local.adr_pu[i] : ""
      "jfrog_ssh_link" = local.t[i] == local.jf_key && var.keyName != "" ? "ssh -i ${var.keyName}.pem  ubuntu@${local.adr_pu[i]}" : ""
    }

  ] : e if e.jfrog_id != ""]

  s_sonar = [for e in [for i in range(length(local.t)) :
    {
      "sonar_id"       = local.t[i] == local.so_key ? local.id[i] : ""
      "sonar_url"      = local.t[i] == local.so_key ? "http://${local.dns[i]}:${var.sonar_port}" : ""
      "sonar_ip_priv"  = local.t[i] == local.so_key ? local.adr_pr[i] : ""
      "sonar_ip_pub"   = local.t[i] == local.so_key ? local.adr_pu[i] : ""
      "sonar_ssh_link" = local.t[i] == local.so_key && var.keyName != "" ? "ssh -i ${var.keyName}.pem ubuntu@${local.adr_pu[i]}" : ""
    }

  ] : e if e.sonar_id != ""]

  s_nexus = [for e in [for i in range(length(local.t)) :
    {
      "nexus_id"       = local.t[i] == local.nx_key ? local.id[i] : ""
      "nexus_url"      = local.t[i] == local.nx_key ? "http://${local.dns[i]}:${var.nexus_port}" : ""
      "nexus_ip_priv"  = local.t[i] == local.nx_key ? local.adr_pr[i] : ""
      "nexus_ip_pub"   = local.t[i] == local.nx_key ? local.adr_pu[i] : ""
      "nexus_ssh_link" = local.t[i] == local.nx_key && var.keyName != "" ? "ssh -i ${var.keyName}.pem  ubuntu@${local.adr_pu[i]}" : ""
    }

  ] : e if e.nexus_id != ""]

}


locals {
  servers_jenkins = length(local.s_jenkins) > 0 ? element(local.s_jenkins, 0) : {}
  servers_jfrog   = length(local.s_jfrog) > 0 ? element(local.s_jfrog, 0) : {}
  servers_sonar   = length(local.s_sonar) > 0 ? element(local.s_sonar, 0) : {}
  servers_nexus   = length(local.s_nexus) > 0 ? element(local.s_nexus, 0) : {}

}


locals {
  so_key = "so"
  jf_key = "jf"
  je_key = "je"
  nx_key = "ne"
  dv_key = "dv"
  qa_key = "qa"
}


locals {
  tag_jenkins = merge(var.jenkins_tag, { key = local.je_key })
  tag_sonar   = merge(var.sonar_tag, { key = local.so_key })
  tag_nexus   = merge(var.nexus_tag, { key = local.nx_key })
  tag_jfrog   = merge(var.jfrog_tag, { key = local.jf_key })
  tag_dev     = merge(var.dev_tag, { key = local.dv_key })
  tag_qa      = merge(var.qa_tag, { key = local.qa_key })
}