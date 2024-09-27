variable "vpc_id" {
  type = string
}
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
variable "priv_sub_id" {
  type = list(string)
}
variable "pub_sub_id" {
  type = list(string)
}
variable "priv_sub_azs" {
  type = list(string)
}
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
