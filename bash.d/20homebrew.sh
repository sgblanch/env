#!/bin/bash

# Place macOS applications in ~/Applications when using brew cask
HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications --fontdir=${HOME}/Library/Fonts --no-quarantine"

# HOMEBREW_DOCKER_REGISTRY_TOKEN
# HOMEBREW_GITHUB_PACKAGES_TOKEN
# HOMEBREW_GITHUB_PACKAGES_USER
HOMEBREW_NO_ANALYTICS=1
HOMEBREW_NO_EMOJI=1
HOMEBREW_NO_ENV_HINTS=1
# HOMEBREW_UPGRADE_GREEDY

export HOMEBREW_CASK_OPTS HOMEBREW_NO_ANALYTICS HOMEBREW_NO_EMOJI HOMEBREW_NO_ENV_HINTS

# Search for homebrew
for dir in ~/opt/brew /opt/homebrew ~/.linuxbrew /home/linuxbrew/.linuxbrew /usr/local; do
	if [[ -x "${dir}/bin/brew" ]]; then
		eval $("${dir}/bin/brew" shellenv)
		break
	fi
done
