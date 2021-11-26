terraform {
  backend "s3" {
    bucket         = "default-terraform-state-ap-southeast-1-999470832247"
    dynamodb_table = "default-terraform-state-ap-southeast-1-999470832247"
    key            = "ap-southeast-1/mfcclhs/mfcclhs-app/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}