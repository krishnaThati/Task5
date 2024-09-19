provider "aws" { 
  region = "us-east-1" # Adjust as needed
}

# Declare the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0e86e20dae9224db8" # Update with your AMI ID
  instance_type = "t2.small" # Update with your instance type

  # Comment out or remove the key_name if not needed
  # key_name      = "my-existing-key-pair" # Specify an existing key pair name here or omit if not needed

  tags = {
    Name = "my-instance"
  }
}

# Outputs
output "public_ip" {
  value = aws_instance.example.public_ip
}
