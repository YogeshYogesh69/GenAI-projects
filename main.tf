provider "aws" {
  region = "us-east-1"
}

module "terraform_vpc" {
  source              = "../../terraform_vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  project_name        = "demo_project"
}

module "ec2_instance" {
  source        = "../../terraform_ec2"
  subnet_id     = module.terraform_vpc.public_subnet_id
  ami_id        = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  key_name      = "terraform_module"
  instance_name = "demo_instance"

}