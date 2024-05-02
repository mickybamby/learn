output "instance_public_ip" { 
    description = "output the public id on an ec2 insttance"
    value = aws_instance.web.public_ip
}