locals {
  tags = merge({
    Terraform = "true"
    Project   = var.project_name
  }, var.tags)
}

provider "aws" {}

data "aws_availability_zones" "available" {}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project_name}-key-pair"
  public_key = var.public_key
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = "${var.project_name}-vpc"
  azs  = data.aws_availability_zones.available.names
  cidr = var.cidr

  public_subnets = [cidrsubnet(var.cidr, 4, 0)]

  tags = local.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.2.0"

  name        = "${var.project_name}-security-group"
  description = "Security group for server with HTTP, HTTPS and SSH ports open to the world"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = local.tags
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "${var.project_name}-ec2"
  instance_count = 1

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.security_group.this_security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  root_block_device = [{
    volume_type           = "gp2"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = true
  }]

  tags = local.tags
}
