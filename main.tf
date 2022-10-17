resource "aws_instance" "ec2_1" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      =  aws_key_pair.generated_key.key_name
  network_interface {
    network_interface_id = aws_network_interface.lal.id
    device_index         = var.device_index
  }
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device ? [{}] : []
    content {
      device_name = var.device_name
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.myefs.dns_name}:/  /var/www/html
  EOF

depends_on = [
  aws_efs_file_system.myefs
]
}
resource "tls_private_key" "tls_private_key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.tls_private_key.public_key_openssh
}


resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
}
resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

}
resource "aws_subnet" "mysubnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet1_cidr_block
  availability_zone = var.availability1_zone

}
resource "aws_elasticache_subnet_group" "bar" {
  name       = var.subnet_group_cache_name
  subnet_ids = [aws_subnet.mysubnet.id]
}
resource "aws_db_subnet_group" "default" {
  name       = var.subnet_group_name
  subnet_ids = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet.id]
}
resource "aws_network_interface" "lal" {
  subnet_id = aws_subnet.mysubnet.id
}



resource "aws_efs_file_system" "myefs" {
  creation_token                  = var.creation_token
  availability_zone_name          = var.availability_zone_name
  encrypted                       = var.encrypted
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode
}

resource "aws_efs_mount_target" "mount" {
file_system_id = aws_efs_file_system.myefs.id
subnet_id      = aws_subnet.mysubnet.id
}

resource "aws_  _cluster" "clustertest" {
  cluster_id           = var.cluster_id
  engine               = var.efs_engine
  engine_version       = var.efs_engine_version
  port                 = var.port
  parameter_group_name = var.parameter_group_name
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  subnet_group_name    =  aws_elasticache_subnet_group.bar.name
  preferred_availability_zones = var.preferred_availability_zones
  apply_immediately            = var.apply_immediately


}
resource "aws_db_instance" "testdb" {
  db_name               = var.db_name
  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  username              = var.username
  password              = var.password
  instance_class        = var.instance_class
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  iops                  = var.iops
  max_allocated_storage = var.max_allocated_storage
  availability_zone     = var.availability_zone
  db_subnet_group_name  = aws_db_subnet_group.default.name
  #   parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  #     dynamic "restore_to_point_in_time" {
  #   # for_each = var.restore_to_point_in_time ? [{}] : []
  #   # content {
  #   # restore_time = "2023-01-02T15:04:05Z07:00"
  #   # source_db_instance_identifier = aws_db_instance.testdb.id
}

                                                                                                                                                                  