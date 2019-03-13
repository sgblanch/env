#!/bin/bash

# Search for and enable command line completion in bash
if ! shopt -oq posix; then
	if command -v brew > /dev/null && [[ -f $(brew --prefix)/etc/bash_completion ]]; then
		. $(brew --prefix)/etc/bash_completion
	elif [[ -f /usr/share/bash-completion/bash_completion ]]; then
		. /usr/share/bash-completion/bash_completion
	elif [[ -f /etc/bash_completion ]]; then
		. /etc/bash_completion
	fi
fi
