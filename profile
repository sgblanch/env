#!/bin/sh

# if running bash, source the user's .bashrc
[[ -n "$BASH_VERSION" ]] && [[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
