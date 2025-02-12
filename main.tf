terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  backend "s3" {
    bucket = "dags-ci-project"
    key = "state/terraform.tfstate"
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