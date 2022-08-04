# Use AWS provider for Terraform

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "basic_rhel" {
  ami           = "ami-06640050dc3f556bb"
  instance_type = "t2.micro" 

  }  

