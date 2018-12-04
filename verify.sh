#!/bin/sh

/usr/bin/gpg --recv-keys "$@"
/usr/bin/git verify-commit HEAD
