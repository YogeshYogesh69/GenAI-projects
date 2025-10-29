# Create a key pair
resource "aws_key_pair" "instance_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_key.public_key_openssh
}

# Generate RSA key
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key locally
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "${var.key_name}.pem"
}

resource "aws_instance" "web" {
    ami           = var.ami_id
    subnet_id     = var.subnet_id
    instance_type = var.instance_type
    key_name      = aws_key_pair.instance_key.key_name

    tags = {
        Name = var.instance_name
    }
}