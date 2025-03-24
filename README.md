# opentofu_org_setup_playground-axi92
opentofu_org_setup_playground-axi92

## Setup
`tofu init`

## Import States
If never run we need to import the states of all resources:

#### Import org settings:
`tofu import -var-file=playground.tfvars github_organization_settings.playground 204191543`

#### Import repo settings:
`tofu import -var-file=playground.tfvars github_repository.opentofu_org_setup_playground-axi92 opentofu_org_setup_playground-axi92`

#### Import github_repository_ruleset:
*Ruleset ID is visible in the url when viewing the ruleset on github.*<br>
`tofu import -var-file=playground.tfvars github_repository_ruleset.protect-main opentofu_org_setup_playground-axi92:4330992`
## Apply
`tofu apply -var-file=playground.tfvars`

## Plan
`tofu plan -var-file=playground.tfvars`
