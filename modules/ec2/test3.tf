resource "aws_instance" "test3" {
    ami = data.aws_ami.amazon-linux.id
    instance_type = var.instance_type["test3"]
    count = var.instance_count["test3"]
    key_name = var.key_name
    
    root_block_device {
      volume_size = var.root_vol_size["test3"]
      volume_type = var.volume_type["common"]
      encrypted = "true"
      tags = { "Name" = "${var.instance_tags["test3"]}-root-vol-${count.index + 1}" }
    }
    tags = merge( { "Name" = "${var.instance_tags["test3"]}-${count.index + 1}" }, local.ec2_common_tags, {"Environment" = "${var.env}"})
    subnet_id = var.priv_sub_id[0] 
    vpc_security_group_ids = [ aws_security_group.test3_sg.id, aws_security_group.common_sg.id ]
}