variable "route53_zone_name" {
  type        = string
  description = "e.g: example.com"
}

variable "alternative_names" {
  type        = list(string)
  description = "the domain prefixes to add to the domain, without the domain itself! for example: apps for apps.example.com"
  default     = ["*"]
}
