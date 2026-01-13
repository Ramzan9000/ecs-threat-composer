terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket-proj"
    key            = "envs/prod/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "prod_dynamodb_table"
    encrypt        = true
  }
}
