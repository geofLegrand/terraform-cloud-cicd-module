
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
      instance_type : "t2.medium",
      volume_size : 30,
      ami : "ami-0a0e5d9c7acc336f1",
      tag : "",
      id : 3
    },
    { name : "nexus",
      script : "install_nexus.sh",
      port : 80,
      description : "open the port of my nexus server",
      sg_name : "allow access on ports 80 and 22"
      instance_type : "t2.medium",
      volume_size : 30,
      ami : "ami-0a0e5d9c7acc336f1",
      tag : "",
      id : 4
    }


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

variable "nexus_instance_type" {
  description = "the default image is t2.medium"

  validation {
    condition     = var.nexus_instance_type != ""
    error_message = "Error: the nexus_instance_type must be no empty"
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



variable "volume_jfrog_size" {
  description = "the default volume size is 20"
  type        = number
  validation {
    condition     = var.volume_jfrog_size >= 8
    error_message = "Error: the volume_jfrog_size must be no empty"
  }
}

variable "volume_jenkins_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.volume_jenkins_size >= 8
    error_message = "Error: the volume_jenkins_size must be grather than 8"
  }
}

variable "volume_nexus_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.volume_nexus_size >= 8
    error_message = "Error: the volume_nexus_size must be grather than 8"
  }
}

variable "volume_sonar_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.volume_sonar_size >= 8
    error_message = "Error: the volume_sonar_size must be grather than 8"
  }
}

variable "volume_qa_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.volume_qa_size >= 8
    error_message = "Error: volume_qa_size must be grather than 8"
  }
}

variable "volume_dev_size" {
  description = "the default volume size is 20"
  type        = number

  validation {
    condition     = var.volume_dev_size >= 8
    error_message = "Error: the volume_dev_size must be no empty"
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
variable "install_nexus" {
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

variable "keyName" {}