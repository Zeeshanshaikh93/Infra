vpc_cidr = "10.0.0.0/16"

subnets_info = [ 
    {
        name = "web-1",
        cidr = "10.0.0.0/24",
        availability_zone = "ap-south-1a"
    },
    {
        name = "web-2",
        cidr = "10.0.1.0/24",
        availability_zone = "ap-south-1b"
    },
    {
        name = "app-1",
        cidr = "10.0.2.0/24",
        availability_zone = "ap-south-1a"
    },
    {
        name = "app-2",
        cidr = "10.0.3.0/24",
        availability_zone = "ap-south-1b"
    },
    {
        name = "db-1"
        cidr = "10.0.4.0/24",
        availability_zone = "ap-south-1a"
    },
    {
        name = "db-2"
        cidr = "10.0.5.0/24",
        availability_zone = "ap-south-1b"
 }]