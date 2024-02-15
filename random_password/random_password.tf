resource "random_password" "password-generator" {
  length           = var.length
  lower            = var.lower
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
  min_upper        = var.min_upper
  numeric          = var.number
  upper            = var.upper
  special          = var.special
  override_special = var.override_special

#description = "with keepers usage we generate random password many times,each and every time while running we get pass with out destroy Beast note it"
 keepers = { 
    trigger = timestamp()
  }
}
