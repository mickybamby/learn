variable "vpc_cidr_block" {
  description = "this is your define vpc cidr block"
  type        = string

}

variable "name_vpc" {
  description = "this is the tag name for vpc"
  type = string
}

variable "pub1_cidr" {
  description = "this is your define subnet for your first public subnet"
  type = string
}

variable "pub1_az" {
  description = "define your first availability zone for your first public sbubet"
  type = string
}

variable "pub2_cidr" {
  description = "this is your define subnet for your second public subnet"
  type = string
}

variable "name_pub1" {
  description = "this is the tag name for your first public subnet"
  type = string
}

variable "pub2_az" {
  description = "this is your define second availability zone for your public subnet"
  type = string
}

variable "name_pub2" {
  description = "this is your tag name for your second public subnet"
  type = string
}

variable "priv1_cidr" {
  description = "this is your define cidr block mask for your private subnet"
  type = string
}

variable "priv1_az" {
  description = "this is the define availability zone for your first private subnet"
  type = string
}

variable "name_priv1" {
  description = "this is the tag name for your first private subnet"
  type = string
}

variable "priv2_cidr" {
  description = "this is your define cidr mask for your second private subnet"
  type = string
}

variable "priv2_az" {
  description = "this is your define availability zone for your second private subnet"
  type = string
}

variable "name_priv2" {
  description = "this is the tag name for your second private subnet"
  type = string
}

variable "name_igw" {
  description = "this is the tag name for our internet gateway"
  type = string
}

variable "name_pub_rt" {
  description = "this is the tag name for the public route table"
  type = string
}

variable "name_priv_rt" {
  description = "this is the tag name for the private route table"
  type = string
}

variable "pnat_gateway" {
  description = "this is tag name for our NAT gateway"
  type = string
}

variable "name_eip" {
  description = "this is tag name for our NAT elastic ip address"
  type = string
}

variable "instance_type" {
  description = "definition for your ec2 instance type"
  type = string
}

variable "instace_tag" {
  description = "this the tag name for our ec2 instance"
  type = string
}

variable "ami" {
  description = "this is the amazon machine image for ec2 instace"
  type = string
}

variable "name_sg" {
  description = "this is the name for the ec2 security group"
  type = string
}











