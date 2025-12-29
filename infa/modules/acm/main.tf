resource "aws_acm_certificate" "this" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = var.tags
}

resource "aws_route53_record" "validation" {
  zone_id = var.zone_id
  name    = aws_acm_certificate.this.domain_name
  type    = "CNAME"
  ttl     = 300
  records = [aws_acm_certificate.this.domain_validation_options[0].resource_record_value]
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [aws_route53_record.validation.fqdn]
}
