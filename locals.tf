locals {
   t = module.server.server_tag_name
   id = module.server.server_id
   dns = module.server.server_dns
   adr_pu = module.server.server_pub_ip
   adr_pr = module.server.server_prv_ip

   s_jenkins =[for e in [for i in range(length(local.t)):
   {
      "jenkins_id" =  local.t[i] == var.je_key ?  local.id[i] : ""  
      "jenkins_url" = local.t[i] == var.je_key ? "http://${local.dns[i]}:${var.jenkin_port}" : ""
      "jenkins_ip_priv" = local.t[i] == var.je_key ? local.adr_pr[i] : ""
       "jenkins_ip_pub" = local.t[i] == var.je_key ?  local.adr_pu[i] : ""
   }
   
   ]: e if e.jenkins_id !="" ]

   
   s_jfrog =[for e in [for i in range(length(local.t)):
   {
      "jfrog_id" =  local.t[i] == var.jf_key ?  local.id[i] : ""  
      "jfrog_url" = local.t[i] == var.jf_key ? "http://${local.dns[i]}:${var.jfrog_port}" : ""
      "jfrog_ip_priv" = local.t[i] == var.jf_key? local.adr_pr[i] : ""
       "jfrog_ip_pub" = local.t[i] == var.jf_key ?  local.adr_pu[i] : ""
   }
   
   ]: e if e.jfrog_id !="" ]

    s_sonar =[for e in [for i in range(length(local.t)):
   {
      "sonar_id" =  local.t[i] == var.so_key ?  local.id[i] : ""  
      "sonar_url" = local.t[i] == var.so_key ? "http://${local.dns[i]}:${var.sonar_port}" : ""
      "sonar_ip_priv" = local.t[i] == var.so_key ? local.adr_pr[i] : ""
      "sonar_ip_pub" = local.t[i] == var.so_key ?  local.adr_pu[i] : ""
   }
   
   ]: e if e.sonar_id !="" ]

       s_nexus =[for e in [for i in range(length(local.t)):
   {
      "nexus_id" =  local.t[i] == var.so_key ?  local.id[i] : ""  
      "nexus_url" = local.t[i] == var.so_key ? "http://${local.dns[i]}:${var.nexus_port}" : ""
      "nexus_ip_priv" = local.t[i] == var.so_key ? local.adr_pr[i] : ""
      "nexus_ip_pub" = local.t[i] == var.so_key ?  local.adr_pu[i] : ""
   }
   
   ]: e if e.nexus_id !="" ]

}


locals {
  servers_jenkins = length(local.s_jenkins) > 0 ? element(local.s_jenkins,0) : {}
  servers_jfrog = length(local.s_jfrog) > 0 ? element(local.s_jfrog,0) : {}
 servers_sonar = length(local.s_sonar) > 0 ? element(local.s_sonar,0) : {}
servers_nexus = length(local.s_nexus) > 0 ? element(local.s_nexus,0) : {}

}