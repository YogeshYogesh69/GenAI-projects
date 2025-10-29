variable "ami_id"{
    description="AMI ID for the EC2 instance"
    type=string
}

variable "instance_type"{
    description="Type of EC2 instance"
    type=string
}

variable "key_name"{
    description="Name of the key pair"
    type=string
}

variable "instance_name"{
    description="Name of the EC2 instance"
    type=string

}

variable "subnet_id" {
  description = "Subnet ID where to launch the instance"
  type        = string
}