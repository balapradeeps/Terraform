output password {
  value     = random_password.password-generator.result
  description = "with keepers usage we generate random password many times,each and every time while running we get pass with out destroy Beast note it"
  sensitive = true
  }