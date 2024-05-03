output "instance_public_ip" { 
    description = "output the public id on an ec2 insttance"
    value = aws_instance.web.public_ip
}

output "elastic_ip" {
  description = "Elastic IP address associated with the instance"
  value       = aws_eip.lb.public_ip
}