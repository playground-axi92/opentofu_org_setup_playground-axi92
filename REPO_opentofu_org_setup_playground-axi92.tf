# If opentofu does not know about this repo if it was already created we have to import this into opentofus state.
# tofu import github_repository.opentofu_org_setup_playground-axi92 opentofu_org_setup_playground-axi92
resource "github_repository" "opentofu_org_setup_playground-axi92" {
  lifecycle {
    prevent_destroy = true
  }
  name                        = "opentofu_org_setup_playground-axi92"
  allow_auto_merge            = false
  allow_merge_commit          = true
  allow_rebase_merge          = false
  allow_squash_merge          = false
  allow_update_branch         = true
  delete_branch_on_merge      = true
  description                 = "opentofu setup for the organisation"
  has_discussions             = true
  has_issues                  = false
  has_wiki                    = false
  has_projects                = false
  merge_commit_message        = "BLANK"
  merge_commit_title          = "PR_TITLE"
  topics                      = ["setup", "opentofu", "terraform", "organisation"]
  visibility                  = "public"
  vulnerability_alerts        = true
  web_commit_signoff_required = false
}

resource "github_branch_protection" "branch_protection" {
  repository_id = github_repository.secure_repo.id
  pattern = "main"
  enforce_admins = true
  require_signed_commits = true
  require_conversation_resolution = true
  required_status_checks {
    # strict to true to be sure that the branch is in sync with main and all changes work on main after the merge
    strict = true
    contexts = ["ci/mondoo"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    restrict_dismissals = true
    required_approving_review_count = 2
    require_code_owner_reviews = true
    dismissal_restrictions = [
      "/user1",
    ]
  }
  restrict_pushes {
    push_allowances = [
      "/user1",
    ]
  }
  allows_force_pushes = false
}
