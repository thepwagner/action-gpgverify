workflow "publish master to latest" {
  on = "push"
  resolves = "publish master"
}

workflow "publish tags" {
  on = "push"
  resolves = "publish tag"
}

action "gpgverify" {
  uses = "./"
  args = [
    "0x4AEE18F83AFDEB23", # GitHub web
    "0x0671E992E8A67A79"  # thepwagner
  ]
}

action "filter master" {
  needs = "gpgverify"
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "publish master" {
  needs = "filter master"
  uses = "./.github/action"
  env = {
    DOCKER_IMAGE = "pwagner/action-gpgverify"
    DOCKERHUB_USERNAME = "pwagner"
  }
  secrets = ["DOCKERHUB_PASSWORD"]
}

action "filter tag" {
  needs = "gpgverify"
  uses = "actions/bin/filter@master"
  args = "tag"
}

action "publish tag" {
  needs = "filter tag"
  uses = "./.github/action"
  env = {
    DOCKER_IMAGE = "pwagner/action-gpgverify"
    DOCKERHUB_USERNAME = "pwagner"
  }
  secrets = ["DOCKERHUB_PASSWORD"]
}
