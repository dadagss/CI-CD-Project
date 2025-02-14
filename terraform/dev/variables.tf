# terraform/dev/variables.tf
variable "service_name" {
  description = "Nome do serviço no App Runner"
  type        = string
}

variable "image_identifier" {
  description = "Identificador da imagem no ECR"
  type        = string
}

variable "access_role_arn" {
  description = "ARN da role de acesso ao ECR"
  type        = string
}

variable "port" {
  description = "Porta exposta pelo contêiner"
  type        = number
  default     = 3001
}

variable "environment_variables" {
  description = "Variáveis de ambiente para o contêiner"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Ambiente (dev, prod, etc.)"
  type        = string
}

variable "CPU" {
  description = "CPU"
  type        = number
  default     = 1
}

variable "RAM" {
  description = "RAM"
  type        = number
  default     = 2
}