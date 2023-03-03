data "aws_route53_zone" "domain_zone" {
  name = var.route53_zone_name
  private_zone = false
}

module "acm" {
  source = "terraform-aws-modules/acm/aws"

  domain_name = data.aws_route53_zone.domain_zone.name
  zone_id     = data.aws_route53_zone.domain_zone.id

  subject_alternative_names = [for aln in var.alternative_names :
  "${aln}.${data.aws_route53_zone.domain_zone.name}"]

  wait_for_validation = false

  tags = {
    Name = var.route53_zone_name
  }
}
