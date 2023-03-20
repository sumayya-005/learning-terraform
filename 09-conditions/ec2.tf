resource "aws_instance" "sample" {
  ami                    = "ami-00d48a21603b2119b"
  instance_type          = "t3.micro"
  vpc_security_group_ids = aws_security_group.allow_ssh.*.id

  tags = {
    Name = "test"
  }
}

provisioner "remote-exec" {
  connection {
    type     = "ssh"
    user     = "root"
    password = "DevOps321"
    host     = self.public_ip
  }

  inline = [
    "yum install nginx -y",
    "systemctl start nginx "
  ]

}


resource "aws_security_group" "allow_ssh" {
count       = var.create_sg ? 1 : 0
name        = "allow_ssh"
description = "Allow TLS inbound traffic"
vpc_id      = "vpc-075435ce9af088bfa"

ingress {
description = "TLS from VPC"
from_port   = 22
to_port     = 22
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
description = "TLS from VPC"
from_port   = 80
to_port     = 80
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
ipv6_cidr_blocks = ["::/0"]
}

tags = {
Name = "allow_ssh"
}
}

variable "create_sg" {
default = true
}