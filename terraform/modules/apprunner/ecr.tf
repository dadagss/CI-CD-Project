resource "aws_ecr_repository" "dags-ci-project" {
  name                 = "dags-ci-project"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    IAC = "True"
  }
}   