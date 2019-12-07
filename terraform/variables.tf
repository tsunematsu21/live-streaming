variable "project_name" {
  type        = string
  description = "A project name used for tags to assign to the resource and resource names"
  default     = "live-streaming"
}

variable "public_key" {
  type        = string
  description = "Public key material to import for the key pair used by EC2 instance"
  default     = null
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "ami_id" {
  type        = string
  description = "The ID of AMI to use when creating an EC2 instance"
  default     = "ami-068a6cefc24c301d2"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "root_volume_size" {
  type        = number
  description = "The size of the root volume attached to the EC2 instance"
  default     = "100"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}
