module "apprunner" {
  source = "../modules/apprunner"

  service_name          = var.service_name
  image_identifier      = var.image_identifier
  access_role_arn       = var.access_role_arn
  port                  = var.port
  environment_variables = var.environment_variables
  environment           = var.environment
  CPU                   = var.CPU
  RAM                   = var.RAM
}