#!/bin/bash

# Use lesspipe, if available, to support more formats and syntax
# highlighting
for lesspipe in lesspipe lesspipe.sh; do
	if command -v "${lesspipe}" > /dev/null; then
		eval "$(SHELL=/bin/sh "${lesspipe}")"
		break
	fi
done

# Defaults for less
#     -i ignore case (when search term is lowercase
#     -M verbose prompt
#     -R show raw control characters (ANSI colors)
LESS="-iMR"

# Disable less's history file
LESSHISTFILE=-

export LESS LESSHISTFILE
