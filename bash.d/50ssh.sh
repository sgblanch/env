#!/bin/bash

# Attempt to load SSH keys into SSH agent, using password(s) stored in
# macOS keychain
[[ "$(uname -s)" == "Darwin" ]] && ssh-add -qA
