resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
root_block_device {
    volume_size = 50 # Change this to 50
    volume_type = "gp3"
  }
  tags = {
    Name = "terraform instance"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls1"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "allow_tls_all"
  }
}