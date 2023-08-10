#!/bin/bash

# Attempt to load SSH keys into SSH agent, using password(s) stored in
# macOS keychain.  Adding keys is slow, so there is a ton of protection
# to prevent running if we don't need to
if [[ -n "${SSH_AUTH_SOCK}" ]] \
	&& [[ "$(uname -s)" == "Darwin" ]] \
	&& [[ -r ~/.ssh/id_rsa || -r ~/.ssh/id_dsa || -r ~/.ssh/id_ecdsa || -r ~/.ssh/id_ed25519 ]] \
	&& ! ssh-add -qL > /dev/null; then
		ssh-add -q --apple-load-keychain
fi
