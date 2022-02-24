# provider information
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWI7TGBPHBVNDQAN7"
  secret_key = "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"
}
#configure route53
resource "aws_route53_zone" "main" {
  name = "google.com"
}

resource "aws_route53_record" "main-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "google.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.main.name_servers
}