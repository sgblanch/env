#!/bin/zsh

if command -v manpath > /dev/null 2>&1; then
	typeset -U MANPATH manpath
	export MANPATH="$(manpath)"
fi
