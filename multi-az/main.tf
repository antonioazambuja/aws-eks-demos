module "eks_cluster" {
    source = "git@github.com:antonioazambuja/terraform-aws-eks.git"
    eks_version = "1.27"
    cluster_name = "eks-multi-az"
    key_pair_name = "sre-laboratory"
    public_subnets = [
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
    private_subnets = [
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
    eks_node_groups = [
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
    eks_tags = {
        Name = "eks-multi-az"
    }
}