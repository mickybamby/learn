module "nginx" {
  source         = "./modules/instance"
  vpc_cidr_block = "172.20.0.0/16"
  name_vpc       = "ngix_vpc"
  pub1_cidr      = "172.20.1.0/24"
  pub1_az        = "eu-west-1a"
  pub2_az        = "eu-west-1b"
  pub2_cidr      = "172.20.2.0/24"
  name_pub2      = "public_subnet2"
  name_pub1      = "public_subnet1"
  priv1_cidr     = "172.20.3.0/24"
  priv1_az       = "eu-west-1a"
  priv2_az       = "eu-west-1b"
  name_priv1     = "private_subnet1"
  priv2_cidr     = "172.20.4.0/24"
  name_priv2     = "private_subnet2"
  name_igw       = "nginix_igw"
  name_pub_rt    = "public_route_table"
  name_priv_rt   = "public_route table"
  pnat_gateway   = "gnix_nat"
  name_eip       = "gnix_nat_ip"
  instance_type  = "t2.micro"
  instace_tag    = "nginx"
  ami            = "ami-0dfdc165e7af15242"
  name_sg        = "nginx_sg"

}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.nginx.instance_public_ip
}

output "elastic_ip" {
  description = "Elastic IP address associated with the instance"
  value       = module.nginx.elastic_ip
}