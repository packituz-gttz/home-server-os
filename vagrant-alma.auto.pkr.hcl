variable "hcp_client_id" {
  type        = string
  sensitive   = true
  description = "Vagrant client id"
}

variable "hcp_client_secret" {
  type        = string
  sensitive   = true
  description = "Vagrant client secret"
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