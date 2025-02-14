terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_apprunner_service" "app" {
  service_name = var.service_name

  source_configuration {
    image_repository {
      image_identifier = var.image_identifier
      image_repository_type = "ECR"

      image_configuration {
        port = var.port
        runtime_environment_variables = var.environment_variables
      }
    }

    authentication_configuration {
      access_role_arn = var.access_role_arn
    }
  }
  instance_configuration {
    cpu    = var.cpu
    memory = var.memory
  }
  tags = {
    Environment = var.environment
    IAC = TRUE
  }
}