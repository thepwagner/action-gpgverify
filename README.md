# GPG Verify Action

```hcl
action "gpgverify" {
  uses = "docker://pwagner/action-gpgverify:latest"
  args = [
    "0x4AEE18F83AFDEB23", # GitHub web, e.g. the "Merge" button
    "0x0671E992E8A67A79"  # your key(s)
  ]
}
```

