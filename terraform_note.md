# Install Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# AWS IAM setup
Create a new IAM user with needed role
Create an access key for the user
Set up default profile with AWS cli
aws configure

# Execute Terraform
terraform init
terraform plan
terraform apply