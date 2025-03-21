terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = var.owner
  token = var.PAT
  # Configuration options
}

resource "github_organization_settings" "playground" {
  lifecycle {
    prevent_destroy = true
  }
  billing_email                                                = var.billing_email
  company                                                      = "Playground Company"
  location                                                     = "Vienna"
  name                                                         = "playground-axi92"
  description                                                  = "Test Description"
  has_organization_projects                                    = false
  has_repository_projects                                      = false
  default_repository_permission                                = "write"
  members_can_create_repositories                              = false
  members_can_create_public_repositories                       = false
  members_can_create_private_repositories                      = false
  members_can_create_pages                                     = false
  members_can_create_public_pages                              = false
  members_can_create_private_pages                             = false
  members_can_fork_private_repositories                        = false
  web_commit_signoff_required                                  = false
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
  # Advanced security is only available with github enterprise
  # advanced_security_enabled_for_new_repositories = true
}
