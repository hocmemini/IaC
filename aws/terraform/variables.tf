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

variable "environment" {
  description = "Environment (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "version" {
  description = "Version of the infrastructure deployment"
  type        = string
  default     = "1.0.0"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "windows-server"
}

variable "owner" {
  description = "Owner of the resource"
  type        = string
  default     = "infrastructure-team"
}

variable "managed_by" {
  description = "Tool/Method used to manage the resource"
  type        = string
  default     = "terraform"
}

variable "cost_center" {
  description = "Cost center for billing purposes"
  type        = string
  default     = "infrastructure"
}

locals {
  common_tags = {
    Environment = var.environment
    Version     = var.version
    Project     = var.project
    Owner       = var.owner
    ManagedBy   = var.managed_by
    CostCenter  = var.cost_center
    CreatedAt   = timestamp()
  }
}
