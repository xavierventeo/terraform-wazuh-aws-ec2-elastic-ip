provider "aws" {
  region = var.region
}

resource "aws_security_group" "siem_sg" {
  tags = {
    Name = "siem_sg"
  }

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.allowed_ip_address] # Cambiado a un rango de IPs diferente
  }

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.allowed_ip_address] # Cambiado a un rango de IPs diferente
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.allowed_ip_address] # Cambiado a un rango de IPs diferente
  }

  ingress {
    from_port   = var.syslog_port # To be able to get logs from Wazuh agents
    to_port     = var.syslog_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.cidr_block_all_traffic]
  }

  ingress {
    from_port   = var.syslog_alternative_port # To be able to get logs from Wazuh agents
    to_port     = var.syslog_alternative_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.cidr_block_all_traffic]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = var.all_protocols
    cidr_blocks = [var.cidr_block_all_traffic]
  }
}

resource "aws_instance" "wazuh_instance" {
  ami                    = var.ami_ubuntu
  instance_type          = var.wazuh_instance_type
  vpc_security_group_ids = [aws_security_group.siem_sg.id]
  key_name               = var.ssh_key_name
  tags = {
    Name = "Wazuh Instance"
  }
}

# Assign an elastic IP
resource "aws_eip" "wazuh_elastic_ip" {
  instance = aws_instance.wazuh_instance.id
  domain   = var.aws_eip_domain
}

output "instance_ip" {
  value = aws_instance.wazuh_instance.public_ip
}
