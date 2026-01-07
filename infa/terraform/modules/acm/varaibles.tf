variable "domain_name" {}
variable "zone_id" {}
variable "tags" {
  type = map(string)
  default = {}
}
