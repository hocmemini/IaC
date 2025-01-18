terraform {
  backend "http" {
    address = "https://api.github.com/repos/{OWNER}/{REPO}/contents/terraform.tfstate"
    username = "GITHUB_USERNAME"
    # Set this as environment variable TF_HTTP_PASSWORD
    # password = "your-github-personal-access-token"
    
    # Optional but recommended - use workspace specific state files
    workspace_dir = "environments"
    
    # These ensure state is updated atomically
    lock_address = "https://api.github.com/repos/{OWNER}/{REPO}/contents/terraform.tfstate.lock"
    unlock_address = "https://api.github.com/repos/{OWNER}/{REPO}/contents/terraform.tfstate.lock"
    
    # Add these headers for GitHub API
    headers = {
      "Accept" = "application/vnd.github.v3+json"
    }
  }
}
