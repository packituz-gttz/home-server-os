variable "cloud_access_token" {
  type        = string
  sensitive   = true
  description = "Vagrant cloud token"
}

variable "box_version" {
  type        = string
  description = "Box version"
}

variable "box_name" {
  type        = string
  description = "Box full name"
}


variable "output_box_version" {
  type        = string
  description = "Box version"
}