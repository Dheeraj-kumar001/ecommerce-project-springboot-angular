
variable "cluster_name" {
  default = "ecommerce-eks-prod"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "CIDR block for subnet1"  
  default = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  description = "CIDR block for subnet2"  
  default = "10.0.2.0/24"
}

variable "private_subnet1_cidr" {
  default = "10.0.101.0/24"
}

variable "private_subnet2_cidr" {
  default = "10.0.102.0/24"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "node_desired_size" {
  default = 3
}

variable "node_min_size" {
  default = 2
}

variable "node_max_size" {
  default = 4
}
