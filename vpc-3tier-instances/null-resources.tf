resource "null_resource" "name" {
  depends_on = [module.ec2-instance-bastion]

  connection {
    type        = "ssh"
    host        = aws_eip.bastion-eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("credentials/tf-kp.pem")
  }


  provisioner "file" {
    source      = "credentials/tf-kp.pem"
    destination = "/tmp/tf-kp.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/tf-kp.pem"
    ]
  }

  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "history/"
    #on_failure = continue
  }

#   provisioner "local-exec" {
#     command     = "echo Destroy time prov `date` >> destroy-time-prov.txt"
#     working_dir = "history/"
#     when        = destroy
#     #on_failure = continue
#   }

}