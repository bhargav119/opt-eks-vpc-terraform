resource "aws_instance" "test1-server" {
    ami = data.aws_ami.amazon-linux.id
    instance_type = var.instance_type["test1"]
    key_name = var.key_name
    
    root_block_device {
      volume_size = var.root_vol_size["test1"]
      volume_type = var.volume_type["common"]
      encrypted = "true"
      tags = {
          "Name" = "${var.instance_tags["test1"]}-root-vol"
      }
    }

    tags = merge( { "Name" = "${var.instance_tags["test1"]}" }, local.ec2_common_tags, {"Environment" = "${var.env}"})

    subnet_id = var.priv_sub_id[1] 

    vpc_security_group_ids = [ aws_security_group.test1_sg.id, aws_security_group.common_sg.id ]
}