#  common security group

resource "aws_security_group" "common_sg" {
  name = var.sg_name_ec2["common"]
  description = var.sg_info_ec2["common"]
  vpc_id = var.vpc_id
  egress {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = merge( { "Name" = var.sg_name_ec2["common"] }, local.ec2_common_tags, {"Environment" = "${var.env}"} )
}
resource "aws_security_group_rule" "sg_common_ingress_rules" {
  for_each          = var.sg_rules_common
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.common_sg.id
}

# test1-sg

resource "aws_security_group" "test1_sg" {
  name = var.sg_name_ec2["test1"]
  description = var.sg_info_ec2["test1"]
  vpc_id = var.vpc_id
  egress {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = merge( { "Name" = var.sg_name_ec2["test1"] }, local.ec2_common_tags, {"Environment" = "${var.env}"} )
}
resource "aws_security_group_rule" "sg_test1_ingress_rules" {
  for_each          = var.sg_rules_test1
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.test1_sg.id
}


#test2-sg

resource "aws_security_group" "test2_sg" {       #changed
  name = var.sg_name_ec2["test2"]
  description = var.sg_info_ec2["test2"]
  vpc_id = var.vpc_id
  egress {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = merge( { "Name" = var.sg_name_ec2["test2"] }, local.ec2_common_tags, {"Environment" = "${var.env}"} )
}
resource "aws_security_group_rule" "sg_test2_ingress_rules" {
  for_each          = var.sg_rules_test2
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.test2_sg.id
}

# test3-sg

resource "aws_security_group" "test3_sg" {
  name = var.sg_name_ec2["test3"]
  description = var.sg_info_ec2["test3"]
  vpc_id = var.vpc_id
  egress {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = merge( { "Name" = var.sg_name_ec2["test3"] }, local.ec2_common_tags, {"Environment" = "${var.env}"} )
}

resource "aws_security_group_rule" "sg_test3_ingress_rules" {
  for_each          = var.sg_rules_test3
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.test3_sg.id
}