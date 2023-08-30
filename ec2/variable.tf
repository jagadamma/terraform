variable "instance_configurations" {
  description = "Map of instance configurations"
  type        = map(object({
    ami           = string
    instance_type = string
   #subnet_id     = string
    vpc_id        = string
    key_name      = string
    tags          = map(string)
  }))

 default = {
     i1 = {
      ami           = "ami-0cf0e376c672104d6" 
      instance_type = "t2.micro"
      key_name      = "vn2"
      vpc_id        = "aws_vpc.vpc.id"
     #subnet_id     = "aws_subnet.pub_subnet-1.id"
      depends_on  = [
             "aws_subnet.pub_subnet-1"
      ] 
      tags = {
         "Name" = "1"
      }        
      #depends_on  = [
       #      "aws_key_pair.deployer"
      #] 
    },
     i2 = {
      ami           = "ami-0911e88fb4687e06b" 
      instance_type = "t2.small"
      key_name      = "vn2"
      vpc_id        = "aws_vpc.vpc.id"
     #subnet_id     = "aws_subnet.priv_subnet-1.id"
      depends_on  = [
             "aws_subnet.priv_subnet-1"
      ]
      #depends_on  = [
      #       "aws_key_pair.deployer"
      #] 
      tags = {
         "Name" = "2"
      }
 
      associate_public_ip_address = "false"
    }
  }
}
