data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket         = var.state_bucket
    key            = "labs/lab_02/terraform.tfstate"
    region         = var.state_region
    dynamodb_table = var.state_lock_table
    encrypt        = true
  }
}
