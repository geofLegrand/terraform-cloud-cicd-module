
provider "aws" {
  region = var.region
}


resource "aws_instance" "server" {
  count                  = length(local.instance)
  ami                    = local.instance[count.index].ami
  instance_type          = local.instance[count.index].instance_type
  user_data              = file("${path.module}/scripts/${local.instance[count.index].script}")
  key_name               = var.keyName
  vpc_security_group_ids = [aws_security_group.security_sg[count.index].id]
  subnet_id              = var.vpc_id == "default" ? aws_default_subnet.default_sub[0].id : var.vpc_id

  tags = local.instance[count.index].name == "jenkins" ? var.jenkins_tag : (
    local.instance[count.index].name == "jfrog" ? var.jfrog_tag :
    local.instance[count.index].name == "qa" ? var.qa_tag :
    local.instance[count.index].name == "dev" ? var.dev_tag :
    local.instance[count.index].name == "nexus" ? var.nexus_tag :
  local.instance[count.index].name == "sonar" ? var.sonar_tag : { Name = "" })

  root_block_device {
    volume_size = local.instance[count.index].volume_size
  }
  # Attach an additional 30 GB EBS volume
  # ebs_block_device {

  #   delete_on_termination = false
  #   device_name = "/dev/xvdf"
  #   volume_size = 30
  #   volume_type = "gp2"
  # }

}


resource "aws_security_group" "security_sg" {
  count  = length(local.instance)
  name   = local.instance[count.index].sg_name
  vpc_id = var.vpc_id == "default" ? aws_default_vpc.default_vpc[0].id : var.vpc_id
  ingress {
    description = local.instance[count.index].description
    from_port   = local.instance[count.index].port
    to_port     = local.instance[count.index].port
    cidr_blocks = ["0.0.0.0/0"] //
    protocol    = "tcp"
  }
  ingress {
    description = "open the port ssh  for my"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"] //
    protocol    = "tcp"
  }
  # ingress { // corresponding to inbound into aws console
  #   description = "open the http"
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]

  # }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tag
}

# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {
  count = length(local.instance) > 0 && var.vpc_id == "default" ? 1 : 0

}

resource "aws_default_subnet" "default_sub" {
  count             = length(local.instance) > 0 && var.vpc_id == "default" ? 1 : 0
  availability_zone = data.aws_availability_zones.available_zones[0].names[0]
  tags              = var.tag
}
# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {
  count = length(local.instance) > 0 && var.vpc_id == "default" ? 1 : 0
}

