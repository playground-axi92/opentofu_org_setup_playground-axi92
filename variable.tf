variable "billing_email" {
  type        = string
  description = "Github organisation billing mail"
}

variable "owner" {
  type        = string
  description = "Github user or organisation"
}

variable "PAT" {
  type        = string
  description = "Personal Access Token with the right permissions set for all the actions for that it is used on that provider."
}

variable "repositories" {
  type = list(object({
    name        = string
    description = string
    visibility  = string
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
    merge_commit_message        = string
    merge_commit_title          = string
    topics                      = list(string)
    vulnerability_alerts        = true
    web_commit_signoff_required = false
  }))
  description = "Map of repository settings"
  nullable    = false
  validation {
    condition = alltrue([
      for repo in var.repositories : (
        contains(["public", "private"], repo.visibility)
        && contains(["PR_BODY", "PR_TITLE", "BLANK"], repo.merge_commit_message)
        && contains(["PR_TITLE", "MERGE_MESSAGE"], repo.merge_commit_title)
        && length(trim(repo.name)) > 0
        && length(trim(repo.description)) > 0
      )
    ])
    error_message = "Not all conditions are met for the repository object list!"
  }
}

