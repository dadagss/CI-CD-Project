terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  backend "s3" {
    bucket = "dags-ci-project"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }

}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "Dagsbucket" {
  bucket        = "dags-ci-project"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = "True"
  }
}

resource "aws_s3_bucket_versioning" "Dagsbucket" {
  bucket = "dags-ci-project"

  versioning_configuration {
    status = "Enabled"
  }
}

# terraform/modules/apprunner/main.tf
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

  tags = {
    Environment = var.environment
  }
}