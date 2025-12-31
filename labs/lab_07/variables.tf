variable "aws_region"  { type = string default = "eu-central-1" }
variable "project"     { type = string default = "terraform-advanced" }
variable "environment" { type = string default = "dev" }
variable "owner"       { type = string default = "team-platform" }
variable "cost_center" { type = string default = "cc-001" }
variable "name_prefix" { type = string description = "np. tf-adv-ab" }

variable "shared_role_arn" { type = string default = "" }
