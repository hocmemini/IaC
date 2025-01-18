variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "windows-server"
}

variable "allowed_rdp_ip" {
  description = "IP address allowed for RDP access"
  type        = string
  default     = "138.88.175.59/32"
}
