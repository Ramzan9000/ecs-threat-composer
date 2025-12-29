variable "zone_id" {}
variable "record_name" {}
variable "record_type" {
  default = "A"
}
variable "ttl" {
  default = 300
}
variable "records" {
  type = list(string)
}
