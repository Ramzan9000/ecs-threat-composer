terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket"
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}