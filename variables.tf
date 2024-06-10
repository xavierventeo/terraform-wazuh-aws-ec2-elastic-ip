variable "region" {
  type    = string
  default = "us-west-2"
}

variable "cidr_block_all_traffic" {
  type    = string
  default = "0.0.0.0/0"
}

variable "vpc_cidr_block_siem" {
  type    = string
  default = "172.32.0.0/16"
}

variable "subnet_cidr_block_siem" {
  type    = string
  default = "172.32.0.0/20"
}

variable "tcp_protocol" {
  type    = string
  default = "tcp"
}

variable "ssh_protocol" {
  type    = string
  default = "ssh"
}

variable "all_protocols" {
  type    = string
  default = "-1"
}

variable "http_port" {
  description = "HTTP port"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "HTTPs port"
  type        = number
  default     = 443
}

variable "ssh_port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "syslog_port" {
  description = "Syslog port"
  type        = number
  default     = 1514
}

variable "syslog_alternative_port" {
  description = "Alternative Syslog port"
  type        = number
  default     = 1515
}

variable "zero_port" {
  description = "Port for allowed outbound traffic (default: 0)"
  default     = 0
}

variable "allowed_ip_address" {
  description = "Allowed IP address for SSH access"
  type        = string
  default     = "0.0.0.0/0" # All traffic by default. Review it at terraform.tfvars
}

variable "ami_ubuntu" {
  type = string
  #default = "ami-0c1c30571d2dae5c9" #eu-west-1
  default = "ami-0cf2b4e024cdb6960" #us-west-2
}

variable "wazuh_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "ssh_key_name" {
  type    = string
  default = "lab_key_pair"
}

variable "ssh_key_full_name" {
  type    = string
  default = "~/.ssh/lab_key_pair.pem"
}

variable "ubuntu_user" {
  type    = string
  default = "ubuntu"
}

variable "aws_availability_zones" {
  type    = string
  default = "available"
}

variable "aws_eip_domain" {
  type    = string
  default = "vpc"
}
