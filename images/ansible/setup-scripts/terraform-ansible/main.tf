provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "terraform_group" {

  # SSH access from anywhere

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]

  }

  # HTTP access from the VPC

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "basic_rhel" {
  ami           = "ami-06640050dc3f556bb"
  instance_type = "t2.micro"
}