variable "install_jenkins" {
  type    = bool
  default = false
}
variable "install_nexus" {
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
  description = "the default image is t2.micro"
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




variable "volume_jfrog_size" {
  description = "the default value is 20"
  default     = 20
}

variable "volume_jenkins_size" {
  description = "the default value is 20"
  default     = 20
}

variable "volume_nexus_size" {
  description = "the default value is 20"
  default     = 20
}

variable "volume_sonar_size" {
  description = "the default value is 20"
  default     = 20
}

variable "volume_qa_size" {
  description = "the default value is 20"
  default     = 20

}

variable "volume_dev_size" {
  description = "the default value is 20"
  default     = 20

}

variable "keyName" {
  default = ""
}

variable "jfrog_tag" {
  description = "the default { Name = jfrog_server Env = Dev  }"

  default = {
    Name = "jfrog_server"
    Env  = "Dev"
  }
  validation {
    condition     = var.jfrog_tag != ""
    error_message = "this variable must be not empty "
  }
}

variable "jenkins_tag" {
  description = "the default { Name = jenkins_server Env = Dev  }"

  default = {
    Name = "jenkins_server"
    Env  = "Dev"
  }

  validation {
    condition     = var.jenkins_tag != ""
    error_message = "this variable must be not empty "
  }
}

variable "nexus_tag" {
  description = "the default { Name = nexus_server Env = Dev  }"

  default = {
    Name = "nexus_server"
    Env  = "Dev"
  }
  validation {
    condition     = var.nexus_tag != ""
    error_message = "this variable must be not empty "
  }
}

variable "sonar_tag" {
  description = "the default { Name = sonar_server Env = Dev  }"

  default = {
    Name = "sonar_server"
    Env  = "Dev"
  }
  validation {
    condition     = var.sonar_tag != ""
    error_message = "this variable must be not empty "
  }
}

variable "qa_tag" {
  description = "the default { Name = qa_server Env = Dev  }"

  default = {
    Name = "qa_server"
    Env  = "Dev"
  }
  validation {
    condition     = var.qa_tag != ""
    error_message = "this variable must be not empty "
  }
}

variable "dev_tag" {
  description = "the default { Name = dev_server Env = Dev  }"
  type        = map(string)
  default = {
    Name = "dev_server"
    Env  = "Dev"
  }

  validation {
    condition     = var.dev_tag != ""
    error_message = "this variable must be not empty "
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
  default = "8081"
}


