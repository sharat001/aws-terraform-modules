provider "aws" {

  access_key = "account ID"

  secret_key = "Key"

 }

 resource "aws_organizations_account" "account" {
  name  = "my_new_account"
  email = "john@doe.org"
}