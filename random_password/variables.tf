variable "length" {
  description = "length of characters"
  default = 12
  }

variable "lower" {
  description = "lower case value"
  default = true
}

variable "min_lower" {
  description = "minimum lower case count"
  default = 3
}

variable "min_numeric" {
  description = "minimum numeric count"
  default = 2
}

variable "min_special" {
  description = "minimum special charaters count"
  default = 3
  }

variable "min_upper" {
  description = "minimum upper case count"
  default = 2
}

variable "number" {
  description = "numeric value "
  default = true
}

variable "override_special" {
  description = "special charater available "
  default = "&!%@+#$"
}

variable "special" {
  description = "special character value"
  default = true
}

variable "upper" {
description = "upper case value"
  default = true
}
