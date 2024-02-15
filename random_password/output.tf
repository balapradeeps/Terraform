output password {
  value     = random_password.password-generator.result
    sensitive = true
  }
