terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}

variable "region" {
  description = "AWS Region"
  default     = "ap-south-1"
}