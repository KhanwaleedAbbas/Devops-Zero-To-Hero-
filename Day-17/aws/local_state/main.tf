# ----------------------
# DEFINE CLOUD PROVIDERS
# -----------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
# --------------------
# EC2 INSTANCE CREATION
# --------------------
resource "aws_instance" "app_server" {  
  ami           ="ami-04f77187b6c113851"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Demo"
  }
}
