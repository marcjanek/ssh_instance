resource "aws_security_group" "ssh_and_http" {
  name = "allow ssh and http"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.ssh_and_http.name]
  key_name = var.key
}