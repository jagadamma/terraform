terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    } 
  }
  provider "aws" {
  region     = "us-west-1"
  
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_security_group" "mysg" {
  name = "ec2 aws_security_group"
  description = "allow acess on ports 22"
  vpc_id = aws_default_vpc.default_vpc.id

}
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["my_ip_adress"]
 }

resource "aws_instance" "myinstance" {
    ami = "ami-0d221cb540e0015f4"
    instance_type = "t2.micro"
    count = "1"

    tags = {
        Name = "My EC2 instance"
    }
}
