terraform {
   backend "s3" {
     bucket         = "my-tf-state-bucket"
     key            = "envs/dev/terraform.tfstate"
     region         = "eu-west-2"
     dynamodb_table = "my-tf-lock-table"
     encrypt        = true
   }
}