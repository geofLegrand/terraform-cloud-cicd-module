
variable "servers" {
  description = "This variable is used to list the servers with those parameters"

  default = [

    { name : "jenkins",
      script : "install_jenkins.sh",
      port : 8080,
      description : "open the port of my jenkins server",
      sg_name : "allow access on ports 8080 and 22"
      instance_type : "t2.micro",
      volume_size : 30,
      ami : "ami-0440d3b780d96b29d",
      tag : "",
      id : 1
    },
    { name : "jfrog",
      script : "install_jfrog.sh",
      port : 8081, description = "open the port of my jfrog server",
      sg_name : "allow access on ports 8081 and 22"
      instance_type : "t2.medium",
      volume_size : 30,
      ami : "ami-0a0e5d9c7acc336f1",
      tag : "",
      id : 2
    },
    { name : "sonar",
      script : "install_sonar.sh",
      port : 9000,
      description : "open the port of my sonar server",
      sg_name : "allow access on ports 9000 and 22"
      instance_type : "t2.micro",
      volume_size : 30,
      ami : "ami-0a0e5d9c7acc336f1",
      tag : "",
    id : 3 }


  ]
}

variable "ami" {
  default = "ami-0440d3b780d96b29d"
}

variable "jfro_instance_type" {

  validation {
    condition     = var.jfro_instance_type != ""
    error_message = "Error: the jfro_instance_type must be no empty"
  }
}

variable "jen_instance_type" {
  # default = "t2.medium"
  description = "the default image is t2.medium"

  validation {
    condition     = var.jen_instance_type != ""
    error_message = "Error: the jen_instance_type must be no empty"
  }
}

variable "nex_instance_type" {
  description = "the default image is t2.medium"

  validation {
    condition     = var.nex_instance_type != ""
    error_message = "Error: the nex_instance_type must be no empty"
  }
}

variable "son_instance_type" {
  description = "the default image is t2.medium"

  validation {
    condition     = var.son_instance_type != ""
    error_message = "Error: the son_instance_type must be no empty"
  }
}

variable "qa_instance_type" {
  description = "the default image is t2.medium"

  validation {
    condition     = var.qa_instance_type != ""
    error_message = "Error: the qa_instance_type must be no empty"
  }
}

variable "dev_instance_type" {
  description = "the default image is t2.medium"

  validation {
    condition     = var.dev_instance_type != ""
    error_message = "Error: the dev_instance_type must be no empty"
  }
}



variable "jfrog_v_size" {
  description = "the default volume size is 20"
  type        = number
  validation {
    condition     = var.jfrog_v_size >= 8
    error_message = "Error: the jfrog_v_size must be no empty"
  }
}

variable "jenkins_v_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.jenkins_v_size >= 8
    error_message = "Error: the jenkins_v_size must be grather than 8"
  }
}

variable "nexus_v_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.nexus_v_size >= 8
    error_message = "Error: the nexus_v_size must be grather than 8"
  }
}

variable "sonar_v_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.sonar_v_size >= 8
    error_message = "Error: the sonar_v_size must be grather than 8"
  }
}

variable "qa_v_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.qa_v_size >= 8
    error_message = "Error: qa_v_size must be grather than 8"
  }
}

variable "dev_v_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.dev_v_size >= 8
    error_message = "Error: the dev_v_size must be no empty"
  }
}



variable "jfrog_tag" {}

variable "jenkins_tag" {}

variable "nexus_tag" {}

variable "sonar_tag" {}

variable "qa_tag" {}

variable "dev_tag" {}

variable "region" {}




variable "subnet_id" {
  type        = string
  default     = ""
  description = "default subnet"
}

variable "tag" {
  type        = map(string)
  description = "(optional) describe your variable"
  default = {
    Name = "jenkins_sever"
    Team = "Dev"
  }
}

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

variable "vpc_id" {
  type        = string
  description = "no vpc? the value of vpc_id is default"
  default     = "default"

}

variable "jfrog_subnet" {
  default = "0"
}
variable "jenkins_subnet" {
  default = "0"
}

variable "sonar_subnet" {
  default = "0"
}

