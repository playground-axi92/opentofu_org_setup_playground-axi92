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

resource "github_repository_ruleset" "protect-main" {
  name        = "protect-main"
  repository  = github_repository.opentofu_org_setup_playground-axi92.name
  target      = "branch"
  enforcement = "active"


  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }
  rules {
    non_fast_forward        = true
    required_linear_history = false
    update                  = false
    deletion                = true
    required_signatures     = true
    pull_request {
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = true
      require_last_push_approval        = true
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }
    merge_queue {
      merge_method = "MERGE"
    }
  }
}
