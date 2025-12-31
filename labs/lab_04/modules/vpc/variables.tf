variable "name_prefix" { type = string }
variable "cidr_block"  { type = string }
variable "az_count"    { type = number default = 2 }
variable "tags"        { type = map(string) default = {} }

validation {
  condition     = can(cidrnetmask(var.cidr_block))
  error_message = "cidr_block musi być poprawnym CIDR."
}
