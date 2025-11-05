terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  backend "s3" {
    bucket         = "summarizer-terraform-state-prod"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "summarizer-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}





# terraform {
#   required_providers {
#     aws = { source = "hashicorp/aws", version = ">= 4.0" }
#   }
#   required_version = ">= 1.2.0"

#    backend "s3" {
#     bucket         = "summarizer-terraform-state-prod"
#     key            = "infra/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "summarizer-terraform-locks"
#     encrypt        = true
#   }
# }

# provider "aws" {
#   region = var.aws_region
# }
