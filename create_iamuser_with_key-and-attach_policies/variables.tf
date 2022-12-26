# Locals Entery Condition
locals {
  tags = merge({
    Name = var.name
  }, var.tags)
}

# Variables

variable name {
  type        = string
  description = "Name for the User"
  default     = "New-User"
}

variable tags {
  type        = map(string)
  description = "Map of tags to apply to resources"
  default     = {}
}

variable cli {
  type        = bool
  description = "Set whether to create a CLI key"
  default     = true
}
