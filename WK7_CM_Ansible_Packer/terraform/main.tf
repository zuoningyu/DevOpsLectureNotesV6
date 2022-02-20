terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

variable "key_name" {
  type = string
  default = "aws_sydney"
}

resource "aws_security_group" "jr_ansible" {
  name        = "jr_ansible"
  description = "Security group for JR ansible course"
  vpc_id      = var.vpc_id

  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]
  ingress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks = []
      description      = ""
      from_port        = 6379
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 6379
      self             = true
    },
  ]

  tags = {
    Name    = "jr_ansible"
    Project = "jrcms"
  }
}

resource "aws_instance" "redis" {
  ami             = "ami-0567f647e75c7bc05"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.jr_ansible.name]
  key_name = var.key_name

  tags = {
    Name    = "redis"
    Project = "jrcms"
  }
}

resource "aws_instance" "web1" {
  ami             = "ami-0567f647e75c7bc05"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.jr_ansible.name]
  key_name = var.key_name

  tags = {
    Name    = "web"
    Project = "jrcms"
  }
}

resource "aws_instance" "web2" {
  ami             = "ami-0567f647e75c7bc05"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.jr_ansible.name]
  key_name = var.key_name

  tags = {
    Name    = "web"
    Project = "jrcms"
  }
}

variable "vpc_id" {
  type = string
  default = "vpc-d11a9fb5"
}



# security group all
#ami-04b9e92b5572fa0d1

