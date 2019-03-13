#!/bin/bash

# Add possible homebrew locations to PATH.  If all exist, order of
# precedence is:
#     $HOME/opt/brew/bin/brew  (Recommended by Steven)
#     /opt/brew/bin/brew       (Alternate location from Steven)
#     /usr/local/bin/brew      (Default instalation directory)
[[ -x "/opt/brew/bin/brew" ]] && PATH="/opt/brew/bin:${PATH}"
[[ -x "${HOME}/opt/brew/bin/brew" ]] && PATH="i${HOME}/opt/brew/bin:${PATH}"

for dir in ~/opt/brew /opt/brew ~/.linuxbrew /home/linuxbrew/.linuxbrew /usr/local; do
	if [[ -d "${dir}" ]] && [[ -x "${dir}/bin/brew" ]]; then
		eval "$(${dir}/bin/brew shellenv)"
		break
	fi
done

# Disable homebrew's analytics
HOMEBREW_NO_ANALYTICS=1

# Place macOS applications in ~/Applications when using brew cask
HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications"

export HOMEBREW_NO_ANALYTICS HOMEBREW_CASK_OPTS
