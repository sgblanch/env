#!/bin/bash

# Search for homebrew
for dir in ~/opt/brew /opt/brew ~/.linuxbrew /home/linuxbrew/.linuxbrew /usr/local; do
	if [[ -x "${dir}/bin/brew" ]]; then
		HOMEBREW_PREFIX="$("${dir}/bin/brew" --prefix)"
		HOMEBREW_CELLAR="$("${dir}/bin/brew" --cellar)"
		HOMEBREW_REPOSITORY="$("${dir}/bin/brew" --repository)"
		prepend_dir PATH "${dir}/sbin"
		prepend_dir PATH "${dir}/bin"
		export HOMEBREW_PREFIX HOMEBREW_CELLAR HOMEBREW_REPOSITORY PATH
		break
	fi
done

# Disable homebrew's analytics
HOMEBREW_NO_ANALYTICS=1

# Place macOS applications in ~/Applications when using brew cask
HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications"

export HOMEBREW_NO_ANALYTICS HOMEBREW_CASK_OPTS
