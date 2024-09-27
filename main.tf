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
