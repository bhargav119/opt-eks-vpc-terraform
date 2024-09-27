module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  pub_sub_azs         = var.pub_sub_azs
  pub_sub_cidr_block  = var.pub_sub_cidr_block
  sub_count           = var.sub_count
  network_tags        = var.network_tags
  priv_sub_azs        = var.priv_sub_azs
  priv_sub_cidr_block = var.priv_sub_cidr_block
  global_route        = var.global_route
  env                 = var.env
}

module "ec2" {
  source                 = "./modules/ec2"
  vpc_id                 =  module.vpc.vpc_id
  env                    = var.env
  sg_name_ec2            = var.sg_name_ec2
  sg_info_ec2            = var.sg_info_ec2  
  sg_rules_common        = var.sg_rules_common
  sg_rules_test1         = var.sg_rules_test1
  sg_rules_test2         = var.sg_rules_test2
  sg_rules_test3         = var.sg_rules_test3
  priv_sub_id            = module.vpc.priv_sub_names[*]
  pub_sub_id             = module.vpc.pub_sub_names[*]
  priv_sub_azs           = module.vpc.priv_sub_azs[*]
  instance_tags          = var.instance_tags
  instance_type          = var.instance_type
  instance_count         = var.instance_count
  root_vol_size          = var.root_vol_size
  volume_type            = var.volume_type
  key_name               = var.key_name
  depends_on = [
    module.vpc
  ]
}
/*
module "eks" {
  source                                = "./modules/eks"
  environment_name                      = var.environment_name
  cluster_name                          = var.cluster_name
  cluster_version                       = var.cluster_version
  region                                = var.region
  vpc_id                                = var.vpc_id
  subnet_ids_for_eks_cluster            = var.subnet_ids_for_eks_cluster
  subnet_ids_for_eks_cluster_node_group = var.subnet_ids_for_eks_cluster_node_group
  eks_cluster_role_name                 = var.eks_cluster_role_name
  node_group_iam_role_name              = var.node_group_iam_role_name
  node_group_name                       = var.node_group_name
  eks_instance_type                     = var.eks_instance_type
  node_disk_size                        = var.node_disk_size
  eks_desired_size                      = var.eks_desired_size
  eks_max_size                          = var.eks_max_size
  eks_min_size                          = var.eks_min_size
  sg_name                               = var.sg_name
  sg_info                               = var.sg_info
  sg_rules_eks_additional               = var.sg_rules_eks_additional
}

*/