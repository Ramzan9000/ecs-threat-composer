terraform {
   backend "s3" {
     bucket         = "my-tf-state-bucket-proj"
     key            = "envs/dev/terraform.tfstate"
     region         = "eu-west-2"
     dynamodb_table = "terrafrom-state-lock"
     encrypt        = true
   }
}