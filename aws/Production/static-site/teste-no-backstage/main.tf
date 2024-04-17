terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "versioning-terraform-home"
    key    = "site-estatico/Production/teste-no-backstage/terraform.tfstate"
    region = "us-east-1"
  }
}


module "cloudfront" {
    source = "git@github.com:fillipepaz/aws-cloudfront-module.git//static-site"
    accountId="704151674151"
    repoNameAndOrg="fillipe/static-site-example"
    bucketName="bucket-teste-no-backstage"
    project="teste-no-backstage" 
    
}