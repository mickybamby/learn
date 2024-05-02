# Deploy NGINX on AWS EC2 using User Data

This Terraform project provisions an AWS EC2 instance and automatically installs and configures an NGINX web server using user data. User data is a script that runs once during the initial launch of the EC2 instance, allowing you to customize the instance configuration.

## Prerequisites
- Terraform installed on your local machine
- AWS account with proper IAM permissions to create resources

## Project Structure
── main.tf
|-provider
├── variables.tf

- `main.tf`: The main Terraform configuration file that defines the resources to be created.
- `variables.tf`: Declares input variables used in the Terraform configuration.
- `provider.tf : The is used to configure define and configure the provider plugins that Terraform uses to interact with the cloud provider.

## Usage

1. Initialize the Terraform working directory:
   <<terraform init>>
2. Review the execution plan:
   <<terraform plan>>
3. Apply the Terraform configuration:
   <<terraform plan>>
This will create an EC2 instance and automatically install and configure NGINX using the `user_data.sh` script.

4. After the apply is complete, retrieve the public IP address of the EC2 instance from the output.tf

5. Open a web browser and navigate to `http://<public_ip>` to see the NGINX welcome page.

## Cleaning Up

When you're done, you can destroy the resources created by Terraform

## Customization

You can customize the EC2 instance configuration, such as instance type, AMI, and other settings, by modifying the variables in the root module main.tf during the depployment.Below is an example of the customization you could make before your deployment:
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

If you need to modify the NGINX configuration or install additional packages, you can update the `user_data.sh` script accordingly.

## License

This project is licensed under the [MIT License](LICENSE).


      
