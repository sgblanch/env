#!/bin/zsh

if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
  fpath=("${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath)

  autoload -Uz compinit
  compinit
fi
