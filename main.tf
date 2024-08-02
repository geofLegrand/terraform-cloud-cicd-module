
module "server" {
  source = "./servers"
  region = var.region
  ########## INSTANCES ##############
  install_dev        = var.install_dev
  install_jfrog      = var.install_jfrog
  install_jenkins    = var.install_jenkins
  install_sonar      = var.install_sonar
  install_qa         = var.install_qa
  jfro_instance_type = var.jfro_instance_type
  jen_instance_type  = var.jen_instance_type
  son_instance_type  = var.son_instance_type
  nex_instance_type  = var.nex_instance_type
  qa_instance_type   = var.qa_instance_type
  dev_instance_type  = var.dev_instance_type
  jfrog_v_size       = var.jfrog_v_size
  jenkins_v_size     = var.jenkins_v_size
  nexus_v_size       = var.nexus_v_size
  qa_v_size          = var.qa_v_size
  dev_v_size         = var.dev_v_size
  sonar_v_size       = var.sonar_v_size

  jfrog_tag   = var.jfrog_tag
  jenkins_tag = var.jenkins_tag
  nexus_tag   = var.nexus_tag
  qa_tag      = var.qa_tag
  dev_tag     = var.dev_tag
  sonar_tag   = var.sonar_tag

  ########## NETWORK ################
  vpc_id         = "default"
  jfrog_subnet   = ""
  jenkins_subnet = ""
  sonar_subnet   = ""
}



