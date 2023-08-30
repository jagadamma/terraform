resource "aws_vpc" "vpc"{
   cidr_block           = "10.0.0.0/16"
   instance_tenancy     = "default"
   assign_generated_ipv6_cidr_block = true
   tags =   {
     Name = "myvpc"
   }
}
resource "aws_subnet" "pub_subnet-1"{
    vpc_id =  aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"
    tags = {
      Name = "public-subnet-1" 
  }
}
resource "aws_subnet" "priv_subnet-1"{
    vpc_id =  aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2b"
    tags = {
      Name = "private-subnet-1" 
  }
}
resource  "aws_internet_gateway" "igw"{
  vpc_id = aws_vpc.vpc.id

  tags ={
    Name = "aws_internet_gateway"
  }
}

resource "aws_route_table" "public_rt"{
   vpc_id = aws_vpc.vpc.id
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.igw.id
   }

   tags = {
     Name = "public route table"
   }
}

resource "aws_route_table_association"  "public-1" {
    subnet_id = aws_subnet.pub_subnet-1.id
    route_table_id = aws_route_table.public_rt.id
}
