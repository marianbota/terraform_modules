resource "aws_instance" "web_server" {
  count = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [ aws_security_group.web_sg.id ]

  tags = {
    Name = "${var.environment}-web-server"
  }
  
}

resource "aws_instance" "alb" {
  count = 1
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [ aws_security_group.web_sg.id ]

  tags = {
    Name = "${var.environment}-alb-server"
  }
  
}

resource "aws_instance" "db_server" {
  count = 1
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  security_groups = [ aws_security_group.db_sg.id ]

  tags = {
    Name = "${var.environment}-db-server"
  }
  
}

# Create a security group for the web server
resource "aws_security_group" "web_sg" {
 name = "public_subnet_sg"
 description = "Security group for the servers in the public subnet"
 vpc_id = var.vpc_id
 # Inbound rule for MySQL
 ingress {
 from_port = 0
 to_port = 0
 protocol = "tcp"
 cidr_blocks = [ "0.0.0.0/0" ]
 }
}

 # Create a security group for the database server
resource "aws_security_group" "db_sg" {
 name = "db_data_passthrough_sg"
 description = "Allow inbound 3306 traffic"
  vpc_id = var.vpc_id
  
 # Inbound rule for MySQL
 ingress {
 from_port = 3306
 to_port = 3306
 protocol = "tcp"
 security_groups = [aws_security_group.web_sg.id]
 }
}