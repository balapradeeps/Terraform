resource "random_password" "autopassgen" {
  length           = var.length
  lower            = var.lower
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
  min_upper        = var.min_upper
  number           = var.number
  upper            = var.upper
  special          = var.special
  override_special = var.override_special
  keepers = {
    trigger = timestamp()
  }
}

output pass {
  value     = random_password.autopassgen.result
  description = "with keepers usage we generate random pass many times, each and every time while running we get pass with out destroy Beast note it "
  sensitive = true
}