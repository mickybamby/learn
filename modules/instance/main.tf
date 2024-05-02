#creation of vpc for our resources
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = var.name_vpc
  }
}

#creation of public and private subnets for public and private instances in two different availability zones for redundancy
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub1_cidr
  availability_zone = var.pub1_az

  tags = {
    Name = var.name_pub1
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub2_cidr
  availability_zone = var.pub2_az

  tags = {
    Name = var.name_pub2
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.priv1_cidr
  availability_zone = var.priv1_az

  tags = {
    Name = var.name_priv1
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.priv2_cidr
  availability_zone = var.priv2_az

  tags = {
    Name = var.name_priv2
  }
}

#creation of internet gateway for our resources to connect to the public internet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.name_igw
  }
}

#creation of public route table and its associated public subnets
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.name_pub_rt
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.main.id
}

#creation of private route table and its associated private subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id

  }

  tags = {
    Name = var.name_priv_rt
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

#creation of our NAT gateway for our resources in the private network to securely communicate with the internet

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = var.name_eip
  }
}

# Create the NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public1.id
  tags = {
    Name = var.pnat_gateway
  }

 
  depends_on = [aws_internet_gateway.gw]
}

#launching of our Ec2 instance for the NGNIX deployment for scalability and high performace
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.example_sg.id]
subnet_id = aws_subnet.public1.id
user_data = data.template_file.user_data.rendered

  tags = {
    Name = var.instace_tag
  }
}

#Define the user data script that would install ngnix on the server for high performance and scalability
data "template_file" "user_data" {
  template = <<-EOF
#!/bin/bash
yum update -y
amazon-linux-extras install -y nginx1
systemctl start nginx
systemctl enable nginx
EOF
}

#create security group for the EC2 instance
resource "aws_security_group" "example_sg" {
  name        = var.name_sg
  description = "Allow inbound HTTP and SSH traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name_sg
  }
}