variable "ami" {
  description = " AMI to use for the instance. "
  type        = string
  # default = "ami-068257025f72f470d"
}

# variable "allocated_storage" {
#   description = "value od"
#   type        = string
#   # default = "ami-068257025f72f470d"
# }


variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
  # default = "t2.micro"
}
variable "cidr_block" {
  description = "value"
  type        = string

}
variable "instance_tenancy" {
  description = "value"
  type        = string


}
variable "key_name" {
  description = "value"
  type        = string
}
variable "algorithm" {
  description = "value"
  type        = string
}

variable "rsa_bits" {
  description = "value"
  type        = number
}
variable "device_index" {
  description = "value"
  type        = number
}
variable "volume_size" {
  description = "value"
  type        = string

}
variable "volume_type" {
  description = "Value"
  type        = string
}

variable "subnet_cidr_block" {
  description = "value"
  type        = string
}

variable "subnet1_cidr_block" {
  description = "value"
  type        = string  
}
variable "subnet_group_name" {
  description = "value"
  type        = string  
}



variable "device_name" {
  description = "value"
  type        = string
}

variable "ebs_block_device" {
  description = "efs"
  type        = bool
  default     = true
}

variable "encrypted" {
  type        = string
  description = "value"

}

# variable "kms_key_id" {
#     type = string
#     description = "value"

# }


variable "performance_mode" {
  type        = string
  description = "value"

}
variable "provisioned_throughput_in_mibps" {
  type        = string
  description = "value"

}
variable "throughput_mode" {
  type        = string
  description = "value"

}





variable "creation_token" {
  description = "value"
  type        = string

}
# # variable "availability_zone_id" {
# #     description = "value"
# #     type = string

# # # }
# variable "transition_to_primary_storage_class" {
#   description = "value"
#   type        = string

# }

# variable "transition_to_ia" {
#   type        = string
#   description = "value"

# }


variable "cluster_id" {
  description = "The name or ID of the craeted cluster"
  type        = string

}
variable "efs_engine_version" {
  description = "Provides the engine version of the elastic cluster"
  type        = string

}
variable "port" {
  description = " The port number on which each of the cache nodes will accept connections."
  type        = string

}
variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this cache cluster."
  type        = string

}
variable "node_type" {
  description = "The instance class used."
  type        = string

}
variable "num_cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have"
  type        = string

}

variable "preferred_availability_zones" {
  description = " List of the Availability Zones in which cache nodes are created."
  type        = list(string)

}
variable "efs_engine" {
  description = "Name of the cache engine to be used for this cache cluster. Valid values are memcached or redis"
  type        = string

}
variable "apply_immediately" {
  description = "Whether any database modifications are applied immediately, or during the next maintenance window. Default is false. "
  type        = string

}
variable "availability_zone" {
  description = "The availability zone of the cluster to be created"
  type        = string

}
variable "availability1_zone" {
  description = "The availability zone of the cluster to be created"
  type        = string
}

variable "subnet_group_cache_name" {
  description = "The name subnet_group for elastic"
  type        = string

}

variable "db_name" {
  description = "Contains the name of the initial database of this instance that was provided at create time,"
  type        = string

}
variable "rds_engine" {
  description = "Provides the name of the database engine to be used for this DB instance."
  type        = string

}
variable "rds_engine_version" {
  description = "Provides the name of the database engine version to be used for this DB instance."
  type        = string

}
variable "username" {
  description = "Contains the master username for the DB instance"
  type        = string

}
variable "password" {
  description = "Contains the password for the DB instance"
  type        = string

}
variable "instance_class" {
  description = "Contains the name of the compute and memory capacity class of the DB instance"
  type        = string

}
variable "storage_type" {
  description = "Storage type associated with DB instance."
  type        = string

}
variable "allocated_storage" {
  description = "Allocated storage size specified in gigabytes"
  type        = number

}
variable "iops" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string

}
variable "max_allocated_storage" {
  description = "The maximum allocated storage"
  type        = number

}

variable "region" {
  description = "The region where the database is created ."
  type        = string

}
variable "availability_zone_name" {
  description = "availability zone"
  type        = string

}
