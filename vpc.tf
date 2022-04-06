resource "aws_vpc" "vpc_kafka" {
  cidr_block                       = var.vpc_cidr
  #instance_tenancy                 = var.instance_tenancy
  #enable_dns_hostnames             = var.enable_dns_hostnames
  #enable_dns_support               = var.enable_dns_support
  #enable_classiclink               = var.enable_classiclink

  tags = {
      Name = "kafka vpc"
    }
}

resource "aws_internet_gateway" "gw_kafka" {
  vpc_id = aws_vpc.vpc_kafka.id

  tags = {
    Name = "internet-gateway-kafka"
  }
}

resource "aws_subnet" "public_kafka" {
  vpc_id     = aws_vpc.vpc_kafka.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_kafka"
  }
}

resource "aws_route_table" "route-public-kafka" {
  vpc_id = aws_vpc.vpc_kafka.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_kafka.id
  }

  tags = {
    Name = "public-route-kafka"
  }
}

resource "aws_route_table_association" "assoc_kafka" {
  subnet_id      = aws_subnet.public_kafka.id
  route_table_id = aws_route_table.route-public-kafka.id

}


#resource "aws_vpc" "default" {
#    cidr_block = var.vpc_cidr
#    enable_dns_hostnames = true
#    tags = {
#        Name = "Kafka VPC"
#    }
#}
