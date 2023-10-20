variable "username" {}


variable "access_key" {
  default = false
}

variable "console" {
  default = false
}

variable "pgp_key" {
  default = null
}

variable "policy_statements" {
  type    = list(any)
  default = null
}

variable "policy_arns" {
  type    = set(string)
  default = null
}

variable "assume_role_arns" {
  type    = set(string)
  default = null
}