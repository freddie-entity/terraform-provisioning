module "ec2-instance-bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  name = "bastion-ec2-instance-${local.name}"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.public-bastion-sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name = "bastion-ec2-instance-${local.name}"
  }
}

resource "aws_eip" "bastion-eip" {
  depends_on = [module.ec2-instance-bastion, module.vpc]

  instance = module.ec2-instance-bastion.id
  vpc      = true
  tags     = local.general_tags
}

module "ec2-instance-private" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "3.4.0"

  name = "private-ec2-instance-${local.name}"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.private-sg.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
  user_data              = file("${path.module}/userdata/httpd-webserver.sh")

  tags = {
    Name = "private-ec2-instance-${local.name}"
  }
}