
module "server" {
  source = "./servers"
  region = var.region
  ########## INSTANCES ##############
  install_dev         = var.install_dev
  install_jfrog       = var.install_jfrog
  install_jenkins     = var.install_jenkins
  install_nexus       = var.install_nexus
  install_sonar       = var.install_sonar
  install_qa          = var.install_qa
  jfro_instance_type  = var.jfro_instance_type
  jen_instance_type   = var.jen_instance_type
  son_instance_type   = var.son_instance_type
  nex_instance_type   = var.nex_instance_type
  qa_instance_type    = var.qa_instance_type
  dev_instance_type   = var.dev_instance_type
  nexus_instance_type = var.nex_instance_type
  volume_jfrog_size   = var.volume_jfrog_size
  volume_jenkins_size = var.volume_jenkins_size
  volume_nexus_size   = var.volume_nexus_size
  volume_qa_size      = var.volume_qa_size
  volume_dev_size     = var.volume_dev_size
  volume_sonar_size   = var.volume_sonar_size
  keyName             = var.keyName


  jfrog_tag   = local.tag_jfrog
  jenkins_tag = local.tag_jenkins #var.jenkins_tag
  nexus_tag   = local.tag_nexus
  qa_tag      = local.tag_qa #   var.qa_tag
  dev_tag     = local.tag_dev
  sonar_tag   = local.tag_sonar

  ########## NETWORK ################
  vpc_id         = "default"
  jfrog_subnet   = ""
  jenkins_subnet = ""
  sonar_subnet   = ""
}



