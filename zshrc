#!/bin/zsh

# Source system zshrc and individual zshrc snippets from ~/zsh.d/
for file in /etc/zshrc ~/.zsh.d/*.zsh; do
	[[ -r "${file}" ]] && source "${file}"
done
