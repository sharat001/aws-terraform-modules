variable "region" {
  type = string
  default = "us-east-1"
}
variable "web_acl_name" {
  type = string
  default = "My_web_ACL"
}
variable "rule_name" {
  type = string
  default = "First_Rule"
}
variable "rule_group_name" {
  type = string
  default = "AWSManagedRulesCommonRuleSet"
}
variable "rule_metric_name" {
  type = string
  default = "friendly-rule-metric-name" 
}
variable "acl_metric_name" {
  type = string
  default = "friendly-acl-metric-name" 
}
