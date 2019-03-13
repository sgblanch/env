#!/bin/sh

# if running bash, source the user's .bashrc
[[ -n "$BASH_VERSION" ]] && [[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
export PATH
