provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      project      = var.project
      environment  = var.environment
      owner        = var.owner
      cost_center  = var.cost_center
      managed_by   = "terraform"
    }
  }
}

provider "aws" {
  alias  = "shared"
  region = var.aws_region

  dynamic "assume_role" {
    for_each = var.shared_role_arn == "" ? [] : [1]
    content { role_arn = var.shared_role_arn }
  }

  default_tags { tags = { account_tier = "shared" } }
}
