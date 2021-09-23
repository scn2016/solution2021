variable "zones" {
  type = list(string)
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet" {
  type = list(string)
}

variable "app_private_subnet" {
  type = list(string)
}

variable "db_private_subnet" {
  type = list(string)
}

variable "allocated_storage" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "username" {
  type      = string
}

variable "password" {
  type      = string
}



