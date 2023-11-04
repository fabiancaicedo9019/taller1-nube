# Región de AWS donde se implementarán los recursos
variable "region" {
  description = "Region de AWS donde se crearan los recursos"
  default     = "us-east-1"
  type        = string
}
