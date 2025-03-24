variable "billing_email" {
  type        = string
  description = "Github organisation billing mail"
}

variable "owner" {
  type        = string
  description = "Github user or organisation"
}

variable "PAT" {
  type        = string
  description = "Personal Access Token with the right permissions set for all the actions for that it is used on that provider."
}
