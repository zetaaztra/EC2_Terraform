# variables.tf

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "key_name" {
  description = "Key pair name for EC2 instance"
  type        = string
  default     = "Zeta-Singapore-Ubuntu"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0497a974f8d5dcef8"
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}
