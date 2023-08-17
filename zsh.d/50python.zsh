#!/bin/zsh

# Add python's user bin directory to PATH
if command -v python3 >/dev/null; then
	path=("$(python3 -m site --user-base)/bin" $path)
fi

export PATH
