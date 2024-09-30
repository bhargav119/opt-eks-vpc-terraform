# for provider
aws_region = "us-west-2"
############################ VPC TFVARS #################################
vpc_cidr_block      = "10.100.0.0/16"
pub_sub_azs         = ["us-west-2a","us-west-2b"]
pub_sub_cidr_block  = ["10.100.0.0/20","10.100.16.0/20"]
priv_sub_azs        = ["us-west-2a","us-west-2b"]
priv_sub_cidr_block = ["10.100.48.0/20","10.100.64.0/20"]
global_route        = "0.0.0.0/0"
env                 = "test-frontm"

sub_count = {
  "public"  = "2"
  "private" = "2"
}
network_tags = {
  "vpc"      = "vpc-testing-copy"
  "priv_sub" = "priv_sub-frontm"
  "pub_sub"  = "pub_sub-frontm"
  "priv_rt"  = "priv_rt-frontm"
  "pub_rt"   = "pub_rt-frontm"
}


##################################  EC2 TFVARS ################################

sg_name_ec2 = {
  "test1"         = "test1-sg"
  "test2"       = "test2-sg"
  "common"        = "common-sg-test"
  "test3"     = "test3-sg"
 # "eks_cluster_additional_sg" = "sg_for_eks_cluster_additional_sg-prod-test"
}

sg_info_ec2 = {
  "test1"         = "sg for test1"
  "test2"       = "sg for test2"
  "test3"         = "sg for test3"
  "common"        = "sg for common  access "
 #"eks_cluster_additional_sg" = "sg for eks_cluster_additional_sg  prod-test"
}

sg_rules_common = {
  ssh_access           = { from = 22, to = 22, proto = "tcp", cidr = "10.100.0.0/16", desc = "Allow ssh internally" }
  node_exporter_access = { from = 9100, to = 9100, proto = "tcp", cidr = "10.100.0.0/16", desc = "Allow node exporter to prometheus ip" }
}

sg_rules_test1 = {
  db_acces        = { from = 27017, to = 27017, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access_mongo = { from = 27019, to = 27019, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access_mon   = { from = 27018, to = 27018, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access       = { from = 8080, to = 8080, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }      
  
}
sg_rules_test2 = {
  db_acces        = { from = 27017, to = 27017, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access_mongo = { from = 27019, to = 27019, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access_mon   = { from = 27018, to = 27018, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access       = { from = 8080, to = 8080, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }      
  
}
sg_rules_test3 = {
  db_acces        = { from = 27017, to = 27017, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access_mongo = { from = 27019, to = 27019, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access_mon   = { from = 27018, to = 27018, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }
  db_access       = { from = 8080, to = 8080, proto = "tcp", cidr = "10.100.0.0/16" , desc = "Allow db port internally" }      
  
}

instance_tags = {
  "test1"           = "frotnm-test1"
  "test2"           = "frontm-test2"
  "test3"           = "frontm-test3"
}
instance_type = {
  "test1"           = "m5.large"
  "test2"           = "m5.xlarge"
  "test3"           = "m5.large"
 }
 volume_type = {
  "common" = "gp3"
}
instance_count = {
  "test1"       = "2"
  "test2"       = "2"
  "test3"       = "1"
 }

 root_vol_size = {
  "test1"           = "50"
  "test2"           = "75"
  "test3"           = "30"
  }
  key_name = "test-frontm"


#############################################  eks variable values #######################################

environment_name                      = "test"
cluster_name                          = "test-eks-cluster"
cluster_version                       = "1.29"
eks_cluster_role_name                 = "test-eks-cluster"
node_group_iam_role_name              = "test-node-group"
vpc_id                                = "vpc-0e33710f3ed32083f"
subnet_ids_for_eks_cluster            = ["subnet-0a1d60f3efa9b5ce2", "subnet-09fba2ec5eebd601b"] 
subnet_ids_for_eks_cluster_node_group = ["subnet-0d73748dfdedebc0e", "subnet-08043cc6d51eecf86"]
node_group_name   = ["test-node-1", "test-node-2"]
eks_instance_type = ["m5.large", "m5.large"]
node_disk_size    = [20, 20]
eks_desired_size  = [1, 1]
eks_min_size      = [1, 1]
eks_max_size      = [2, 2]


sg_name = {
  "eks_cluster_additional_sg" = "sg_for_dev_eks_cluster_additional_sg"
}
sg_info = {
  "eks_cluster_additional_sg" = "sg_for_dev_eks_cluster_additional_sg"
}
sg_rules_eks_additional = {
  htpps_access = { from = 443, to = 443, proto = "tcp", cidr = "10.70.49.110/32", desc = "Allow access to kube" },
}

  
