#!/bin/sh

/usr/bin/gpg --keyserver pgp.mit.edu --recv-keys "$@"
/usr/bin/git verify-commit HEAD
