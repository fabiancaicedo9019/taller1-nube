# Región de AWS donde se implementarán los recursos
variable "region" {
  description = "Region de AWS donde se crearan los recursos"
  default     = "us-east-1"
  type        = string
}

variable "ec2_name" {
  description = "Nombre de la maquina EC2"
  type        = string
}

variable "ami" {
  description = "ID del Amazon Machine Image (AMI)"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
}

variable "os_type" {
  description = "Tipo de sistema operativo (values: linux o windows)"
  type        = string
  default     = "linux"
}

variable "key_name" {
  description = "Nombre de la llave SSH"
  type        = string
}