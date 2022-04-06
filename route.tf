resource "aws_route" "route_kafka" {
  route_table_id         = aws_vpc.vpc_kafka.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw_kafka.id
}

resource "aws_route_table" "routetable_kafka" {
    vpc_id = aws_vpc.vpc_kafka.id

    route {
       cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw_kafka.id
    }

    tags = {
        Name = "Kafka Public Subnet"
    }
}

#resource "aws_route_table_association" "assoc_kafka" {
#    subnet_id = aws_subnet.public_kafka.id
#    route_table_id = aws_route_table.routetable_kafka.id
#}



