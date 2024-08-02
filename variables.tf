variable "install_jenkins" {
  type    = bool
  default = false
}
variable "install_jfrog" {
  type    = bool
  default = false
}
variable "install_sonar" {
  type    = bool
  default = false
}
variable "install_dev" {
  type    = bool
  default = false
}
variable "install_qa" {
  type    = bool
  default = false
}

variable "jfro_instance_type" {
  description = "the default image is t2.medium"
  default     = "t2.medium"

}

variable "jen_instance_type" {
  description = "the default image is t2.medium"
  default     = "t2.medium"

}
variable "nex_instance_type" {
  description = "the default image is t2.medium"
  default     = "t2.medium"

}
variable "son_instance_type" {
  description = "the default image is t2.medium"
  default     = "t2.medium"

}
variable "qa_instance_type" {
  description = "the default image is t2.medium"
  default     = "t2.medium"

}

variable "dev_instance_type" {
  description = "the default image is t2.medium"
  default     = "t2.medium"

}



variable "jfrog_v_size" {
  description = "the default value is 20"
  default     = 20
}

variable "jenkins_v_size" {
  description = "the default value is 20"
  default = 20
}

variable "nexus_v_size" {
  description = "the default value is 20"
  default = 20
}

variable "sonar_v_size" {
  description = "the default value is 20"
  default     = 20
}

variable "qa_v_size" {
  description = "the default value is 20"
  default     = 20

}

variable "dev_v_size" {
  description = "the default value is 20"
  default     = 20

}


variable "jfrog_tag" {
  description = "the default { Name = jfrog_server Env = Dev  }"

  default = {
    Name = "jfrog_server"
    Env  = "Dev"
  }
}

variable "jenkins_tag" {
  description = "the default { Name = jenkins_server Env = Dev  }"

  default = {
    Name = "jenkins_server"
    Env  = "Dev"
  }
}

variable "nexus_tag" {
  description = "the default { Name = nexus_server Env = Dev  }"

  default = {
    Name = "nexus_server"
    Env  = "Dev"
  }
}

variable "sonar_tag" {
  description = "the default { Name = sonar_server Env = Dev  }"

  default = {
    Name = "sonar_server"
    Env  = "Dev"
  }
}

variable "qa_tag" {
  description = "the default { Name = qa_server Env = Dev  }"

  default = {
    Name = "qa_server"
    Env  = "Dev"
  }
}

variable "dev_tag" {
  description = "the default { Name = dev_server Env = Dev  }"

  default = {
    Name = "dev_server"
    Env  = "Dev"
  }
}




variable "region" {
  default = "us-east-1"
}


variable "jenkin_port" {
    default = "8080"
}

variable "jfrog_port" {
    default = "8081"
}

variable "sonar_port" {
    default = "9000"
}

variable "nexus_port" {
    default = "8080"
}

variable "so_key" {
    description = "do not modify this value"
  default = "sonar_server" 
}
variable "jf_key" {
    description = "do not modify this value"
  default = "jfrog_server" 
}
variable "je_key" {
    description = "do not modify this value"
  default = "jenkins_server" 
}
variable "ne_key" {
    description = "do not modify this value"
  default = "nexus_server" 
}