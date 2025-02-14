# terraform/modules/apprunner/variables.tf
variable "service_name" {
  description = "Nome do serviço no App Runner"
  type        = string
}

variable "image_identifier" {
  description = "Identificador da imagem no ECR (ex: <account-id>.dkr.ecr.<region>.amazonaws.com/meu-repositorio:tag)"
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

variable "access_role_arn" {
  description = "ARN da role de acesso ao ECR"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, prod, etc.)"
  type        = string
}


variable "CPU" {
  description = "CPU"
  type        = string
  default     = "1 vCPU"
}

variable "RAM" {
  description = "RAM"
  type        = string
  default     = "2 GB"
}