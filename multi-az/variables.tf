variable "cidr_block" {
    default = "10.51.0.0/16"
}

variable "public_subnets" {
    default = [
        {
            availability_zone = "us-east-1a"
            newbits = 8
        },
        {
            availability_zone = "us-east-1b"
            newbits = 8
        },
        {
            availability_zone = "us-east-1c"
            newbits = 8
        }
    ]
}

variable "private_subnets" {
    default = [
        {
            availability_zone = "us-east-1a"
            newbits = 5
        },
        {
            availability_zone = "us-east-1b"
            newbits = 5
        },
        {
            availability_zone = "us-east-1c"
            newbits = 5
        }
    ]
}

variable "vpc_tags" {
    default = {
        Name = "MainVPC"
    }
}

variable "public_subnet_tags" {
    default = {
        AccessMode = "PUBLIC"
    }
}

variable "igw_tags" {
    default = {
        Name = "MainIGW"
    }
}

variable "rt_igw_tags" {
    default = {
        Name = "MainIGW"
    }
}

variable "private_subnet_tags" {
    default = {
        AccessMode = "PRIVATE"
    }
}

variable "eip_nat_tags" {
    default = {
        Name = "EIPVpc"
    }
}

variable "nat_gateway_tags" {
    default = {
        Name = "MainNATGateway"
    }
}

variable "rt_nat_tags" {
    default = {
        Name = "MainNATGateway"
    }
}

variable "cluster_name" {
    default = "eks-multi-az"
}

variable "region" {
    default = "us-east-1"
}

variable "kubernetes_version" {
    default = "1.27"
}

variable "eks_node_groups" {
    default = [
        {
            desired_size = 1
            max_size     = 3
            min_size     = 1
            name         = "general-purpose"
            instance_types = ["t3.large", "t3.xlarge"]
        },
        # {
        #     desired_size = 1
        #     max_size     = 3
        #     min_size     = 1
        #     name         = "arm-based"
        #     instance_types = ["t4g.large", "t4g.xlarge"]
        # },
        {
            desired_size = 1
            max_size     = 3
            min_size     = 1
            name         = "latest-gen-general-purpose"
            instance_types = ["m5.xlarge"]
        }
    ]
}

variable "desired_size" {
    default = 3
}

variable "max_size" {
    default = 10
}

variable "min_size" {
    default = 3
}