terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket-proj"
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "dev_dynamodb_table"
    encrypt        = true
  }
}