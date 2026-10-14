# Plumbing. Remote state in YOUR Cloudflare R2 bucket (S3-compatible API).
# Edit the bucket + account id ONCE during setup.
#
# There is ONE state file per load balancer. The `key` is NOT set here -- it is
# supplied at init time by the pipeline, e.g.:
#   terraform init -backend-config="key=load-balancers/acme.tfstate"
#
# Credentials come from environment variables (never stored here):
#   AWS_ACCESS_KEY_ID     = your R2 Access Key ID
#   AWS_SECRET_ACCESS_KEY = your R2 Secret Access Key
terraform {
  backend "s3" {
    bucket = "terraform-tfstate" # <-- your R2 bucket name
    region = "auto"

    endpoints = {
      # Replace with your Cloudflare Account ID.
      s3 = "https://68e1253a502bd37e8feabeea38358543.r2.cloudflarestorage.com"
    }

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}