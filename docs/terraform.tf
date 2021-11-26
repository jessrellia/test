terraform {
  backend "s3" {
    bucket         = "default-terraform-state-us-west-1-999470832247"
    dynamodb_table = "default-terraform-state-us-west-1-999470832247"
    key            = "us-west-1/mfcclhs/mfcclhs-app/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
  }
}