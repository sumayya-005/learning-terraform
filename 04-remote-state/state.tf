terraform {
  backend "s3" {
    bucket = "terraform-005"
    key    = "04-resources/terraform.tfstate"
    region = "us-east-1"
  }
}