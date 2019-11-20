variable "server_port" {
  default = "8080"
}


resource "aws_instance" "example" {
  ami                    = "ami-0d5d9d301c853a04a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
		#!bin/bash
		echo "Hello Alvaro" > index.html
		nohup busybox httpd -f -p "${var.server_port}" &
		EOF

  tags = {
    Name = "terraform-example"
  }

}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.example.public_ip}"

}

output "public_dns" {
  value = "${aws_instance.example.public_dns}"
}
