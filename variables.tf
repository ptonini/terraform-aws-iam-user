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

variable "policy_statement" {
  type    = list(any)
  default = null
}

variable "policy_arns" {
  type    = set(string)
  default = []
}

variable "assume_role_arns" {
  type    = set(string)
  default = null
}