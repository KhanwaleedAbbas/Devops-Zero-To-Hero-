terraform {
  backend "s3" {
    bucket         = "728721961620-terraform-states"   # ✅ Replace with your S3 bucket name
    key            = "global/terraform.tfstate"        # ✅ State file path in the bucket     
    region         = "ap-south-1"                      # ✅ AWS region
    dynamodb_table = "terraform-lock"                  # ✅ DynamoDB table for locking
    encrypt        = true                              # ✅ Encrypt state file at rest
  }
}
