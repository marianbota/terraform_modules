variable "ami_id" {
  description = "AWS AMI ID"
  type        = string
  default     = "ami-0c4fc5dcabc9df21d"
}

variable "instance_type" {
  description = "AWS Instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the subnet"
  type        = string
}