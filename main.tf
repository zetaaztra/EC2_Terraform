# main.tf

# Create a security group allowing all TCP and SSH traffic
resource "aws_security_group" "allow_all_tcp_ssh" {
  name        = "allow_all_tcp_ssh"
  description = "Allow all TCP and SSH inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows all TCP traffic
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance using an existing key pair
resource "aws_instance" "ubuntu_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.allow_all_tcp_ssh.id]

  key_name = var.key_name

  root_block_device {
    volume_size = 20 # 20 GB memory
    volume_type = "gp2"
  }

  tags = {
    Name = "UbuntuServer"
  }
}
