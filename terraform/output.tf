output "private_ip" {
  description = "The private IP addresses assigned to the instance"
  value       = module.ec2.private_ip[0]
}

output "public_ip" {
  description = "The public IP addresses assigned to the instance"
  value       = module.ec2.public_ip[0]
}
