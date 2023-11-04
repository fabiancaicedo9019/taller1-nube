# Región de AWS donde se implementarán los recursos
variable "region" {
  description = "Region de AWS donde se crearan los recursos"
  default     = "us-east-1"
  type        = string
}

variable "db_allocated_storage" {
  description = "La cantidad de almacenamiento en gigabytes que se asignará a la instancia de base de datos."
  type        = number
}

variable "db_storage_type" {
  description = "El tipo de almacenamiento que se utilizará para la instancia de base de datos. Ejemplos comunes incluyen gp2 para SSD de uso general y io1 para SSD de alto rendimiento."
  type        = string
}

variable "db_engine" {
  description = "El motor de base de datos para usar. Ejemplo: 'postgres' para PostgreSQL."
  type        = string
}

variable "db_engine_version" {
  description = "La versión del motor de base de datos. Por ejemplo, '15.3-R2' para una versión específica de PostgreSQL."
  type        = string
}

variable "db_instance_class" {
  description = "El tipo de instancia de base de datos que se utilizará, lo que determina la capacidad computacional y de memoria. Por ejemplo: 'db.t3.micro' para una instancia de micro de la capa gratuita."
  type        = string
}

variable "db_instance_identifier" {
  description = "El identificador único para la instancia de base de datos. Debe ser único dentro de una región de AWS."
  type        = string
}

variable "db_username" {
  description = "El nombre de usuario del administrador para la instancia de base de datos."
  type        = string
}

variable "db_password" {
  description = "La contraseña para el usuario administrador de la instancia de base de datos."
  type        = string
}

variable "db_parameter_group_name" {
  description = "El nombre del grupo de parámetros que se asociará con esta instancia de base de datos."
  type        = string
}

variable "db_publicly_accessible" {
  description = "Indica si la instancia de base de datos es accesible públicamente."
  default     = true
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "Determina si se omite la creación de una imagen final al eliminar la base de datos. Importante para evitar cargos adicionales."
  default     = true
  type        = bool
}

variable "db_storage_encrypted" {
  description = "Indica si el almacenamiento de la base de datos estará cifrado."
  default     = false
  type        = bool
}

variable "db_auto_minor_version_upgrade" {
  description = "Indica si las actualizaciones menores de la versión de la base de datos se aplicarán automáticamente."
  default     = false
  type        = bool
}

variable "db_port" {
  description = "El puerto en el que el servicio de base de datos aceptará conexiones."
  default     = 5432
  type        = number
}
