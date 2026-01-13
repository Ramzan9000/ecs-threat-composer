variable "zone_id" {
  description = "ID of an existing Route53 hosted zone"
  type        = string
}

variable "record_name" {
  description = "DNS record name (e.g. www.example.com)"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Route53 zone ID of the ALB"
  type        = string
}
