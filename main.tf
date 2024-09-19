provider "aws" {
  region = "us-east-1" # Adjust as needed
}

# Declare the private key resource
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Use the public key from the private key for AWS key pair
resource "aws_key_pair" "key" {
  key_name   = "my-key-pair"
  public_key = tls_private_key.key.public_key_openssh
}

# Declare the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0e86e20dae9224db8" # Update with your AMI ID
  instance_type = "t2.small" # Update with your instance type
  key_name      = aws_key_pair.key.key_name

  tags = {
    Name = "my-instance"
  }
}

# Outputs
output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.key.private_key_pem
  sensitive = true
}

output "public_key_openssh" {
  value = tls_private_key.key.public_key_openssh
}
