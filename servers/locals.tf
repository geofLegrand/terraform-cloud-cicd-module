
locals {
  new_instanes = [for e in var.servers : merge(e, {

    instance_type = (e.name == "jenkins" && var.jen_instance_type != "") ? var.jen_instance_type : (

      (e.name == "jfrog" && var.jfro_instance_type != "") ? var.jfro_instance_type :
      (e.name == "qa" && var.qa_instance_type != "") ? var.qa_instance_type :
      (e.name == "dev" && var.dev_instance_type != "") ? var.dev_instance_type :
      (e.name == "nexus" && var.nexus_instance_type != "") ? var.nexus_instance_type :
    (e.name == "sonar" && var.son_instance_type != "") ? var.son_instance_type : e.instance_type)

    volume_size = e.name == "jenkins" ? var.volume_jenkins_size : (

      e.name == "jfrog" ? var.volume_jfrog_size :
      e.name == "qa" ? var.volume_qa_size :
      e.name == "dev" ? var.volume_dev_size :
      e.name == "nexus" ? var.volume_nexus_size :
    e.name == "sonar" ? var.volume_sonar_size : e.volume_size)

    })

  ]
}


locals {

  instance = [for p in [for e in local.new_instanes :
    (e.name == "jenkins" && var.install_jenkins) ? e :
    (e.name == "jfrog" && var.install_jfrog) ? e :
    (e.name == "qa" && var.install_qa) ? e :
    (e.name == "dev" && var.install_dev) ? e :
    (e.name == "nexus" && var.install_nexus) ? e :
    (e.name == "sonar" && var.install_sonar == true) ? e : { id = 0 }

  ] : p if p.id != "0"]

}

 