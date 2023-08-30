provider "aws" {
  region = "us-east-2"  
}

module "ec2_instances" {
  source = "./ec2"

}
