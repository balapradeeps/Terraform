variable "service_ports" {
  description = "List of ports for ingress rules"
  type        = list(number)
  default     = [80, 443, 8080, 8089, 52552, 62341, 22, 21, 8321]  # Example: Add the desired ports here
}