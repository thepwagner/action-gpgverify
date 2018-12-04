workflow "publish master to latest" {
  on = "push"
  resolves = "publish"
}

action "gpgverify" {
  uses = "./"
  args = [
    "0x4AEE18F83AFDEB23", # GitHub web
    "0x0671E992E8A67A79"  # thepwagner
  ]
}

# Publish "master" to ":latest"
action "filter-master" {
  needs = "gpgverify"
  uses = "actions/bin/filter@master"
  args = "branch master"
}
action "publish" {
  needs = "filter-master"
  uses = "docker://alpine:3.8"
  runs = "sh"
  args = "echo publish_goes_here"
}

