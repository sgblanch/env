#!/bin/bash

if [[ "true" == "${enable_color}" ]]; then
	# Enable color for BSD-based ls.  This works on OS X
	export CLICOLOR=1

	# Color configuration for GNU coreutils
	if command -v dircolors > /dev/null; then
		[[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	fi

	# Detect GNU ls
	if command -v ls > /dev/null && ls --color=auto > /dev/null 2>&1; then
		gnu_color="--color=auto"
	fi

	# color dir if found & supported
	if command -v dir > /dev/null && dir --color=auto > /dev/null 2>&1; then
		alias dir='dir --color=auto'
	fi

	# color vdir if found & supported
	if command -v vdir > /dev/null && vdir --color=auto > /dev/null 2>&1; then
		alias vdir='vdir --color=auto'
	fi

	# All modern greps appear to support color
	grep_color="--color=auto"
fi

# Report blocks in kilobytes (df, du, etc)
export BLOCKSIZE=1024

# ls aliases
alias   ls="ls   ${gnu_color:-} -F"
alias   ll="ls   ${gnu_color:-} -l"
alias   la="ls   ${gnu_color:-} -A"
alias    l="ls   ${gnu_color:-} -CF"

# grep aliases
alias  grep="grep  ${grep_color:-} --exclude-dir=.git --exclude-dir=.svn"
alias egrep="egrep ${grep_color:-} --exclude-dir=.git --exclude-dir=.svn"
alias fgrep="fgrep ${grep_color:-} --exclude-dir=.git --exclude-dir=.svn"

if [[ "true" == "${confirm}" ]]; then
	# Confirm if overwriting destination file
	alias cp='cp -i'
	alias mv='mv -i'

	# Confirm when deleting all files
	alias rm='rm -i'

	# Confirm when deleting 3 or more files.  (No safe way to detect this capability)
	#alias rm='rm -I'
fi

# Send 4 pings instead of an infinite number
alias ping='ping -c4'

# Use colordiff, if available
if command -v colordiff > /dev/null; then
	alias diff='colordiff'
fi

unset gnu_color grep_color
