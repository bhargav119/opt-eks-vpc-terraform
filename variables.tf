# For Provides
variable "aws_region" {
  type = string
}
######################################## VPC variables ########################################
variable "vpc_cidr_block" {
  type = string
}
variable "sub_count" {
  type = map(string)
  description = "public / private subcounts"
}   
variable "pub_sub_cidr_block" {
  type = list
}
variable "priv_sub_cidr_block" {
  type = list
}
variable "network_tags" {
  type = map(string)
  description = "common network tags"
}
variable "pub_sub_azs" {
  type = list
}
variable "priv_sub_azs" {
  type = list
}
variable "global_route" {
  type = string
}

locals {
  vpc_common_tags = {
    Team       = "DevOps"
    Terraform = "true"
    Environment = "test"
    Timestamp = formatdate("DD-MMM-YYYY hh:mm:ss ZZZ", timestamp())
  }
}


#################################  ec2 variables ###############################################################


#variable "vpc_id" {
 # type = string
#}
variable "sg_name_ec2" {
  type = map
}
variable "sg_info_ec2" {
  type = map
}
variable "sg_rules_common" {
  type = map
}
variable "sg_rules_test1" {
  type = map
}
variable "sg_rules_test2" {
  type = map
}
variable "sg_rules_test3" {
  type = map
} 
#variable "priv_sub_id" {
 # type = list(string)
#}
#variable "pub_sub_id" {
 # type = list(string)
#}
#variable "priv_sub_azs" {
 # type = list(string)
#}
variable "instance_tags" {
  type = map
}
variable "instance_type" {
  type = map
}
variable "instance_count" {
  type = map
}
variable "root_vol_size" {
  type = map
}
variable "volume_type" {
  type = map
}
variable "key_name" {
  type = string
}
variable "env" { 
  type = string
}
locals {
  ec2_common_tags = {
    Terraform = "true"
    # Environment = "stage"
    # Timestamp = formatdate("DD-MMM-YYYY hh:mm:ss ZZZ", timestamp())
  }
}


#####################################  eks variables ################################################



variable "environment_name" {
  type = string
}
variable "cluster_name" {
    type = string
}
variable "cluster_version" {
    type = string
}
variable "subnet_ids_for_eks_cluster" {
    type = list(string)
}
variable "subnet_ids_for_eks_cluster_node_group" {
    type = list(string)
}

# IAM info
variable "eks_cluster_role_name" {
    type = string
}

variable "node_group_iam_role_name" {
    type = string
}

variable "node_group_name" {
    type = list(string)
}
variable "eks_instance_type" {
    type = list(string)
}
variable "node_disk_size" {
    type = list(number)
}
variable "eks_desired_size" {
    type = list(number)
}
variable "eks_min_size" {
    type = list(number)
}
variable "eks_max_size" {
    type = list(number)
}


# security group info
variable "sg_name" {
    type = map(string)
}
variable "sg_info" {
    type = map(string)
}
variable "sg_rules_eks_additional" {
    type = map
}

