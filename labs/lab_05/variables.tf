variable "aws_region"  { type = string default = "eu-central-1" }
variable "project"     { type = string default = "terraform-advanced" }
variable "environment" { type = string default = "dev" }
variable "owner"       { type = string default = "team-platform" }
variable "cost_center" { type = string default = "cc-001" }
variable "name_prefix" { type = string description = "np. tf-adv-ab" }

variable "vpc_id" { type = string }
variable "ingress_rules" {
  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidrs     = list(string)
  }))
}
