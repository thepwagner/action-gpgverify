workflow "verify-on-push" {
  on = "push"
  resolves = "gpgverify"
}

action "gpgverify" {
  uses = "./"
  args = [
    "0x0671E992E8A67A79"
  ]
}

