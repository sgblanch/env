#!/bin/bash

# Report blocks in kilobytes (df, du, etc)
BLOCKSIZE=1024

# Enable color for BSD-based ls.  This works on OS X
CLICOLOR=1

export BLOCKSIZE CLICOLOR

# Color configuration for GNU coreutils
if command -v dircolors > /dev/null; then
	[[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Detect GNU ls
if command -v ls > /dev/null && ls --color=auto > /dev/null 2>&1; then
	gnu_color="--color=auto"
fi

# ls aliases
alias   ls="ls ${gnu_color:-} -F"
alias   ll="ls ${gnu_color:-} -lF"
alias   la="ls ${gnu_color:-} -AF"
alias    l="ls ${gnu_color:-} -F"
unset gnu_color

# color dir if found & supported
if command -v dir > /dev/null && dir --color=auto > /dev/null 2>&1; then
	alias dir='dir --color=auto'
fi

# color vdir if found & supported
if command -v vdir > /dev/null && vdir --color=auto > /dev/null 2>&1; then
	alias vdir='vdir --color=auto'
fi

# grep aliases
alias  grep="grep  --color=auto --exclude-dir=.git --exclude-dir=.svn"
alias egrep="egrep --color=auto --exclude-dir=.git --exclude-dir=.svn"
alias fgrep="fgrep --color=auto --exclude-dir=.git --exclude-dir=.svn"

# Confirm if overwriting destination file
alias cp='cp -i'
alias mv='mv -i'

if rm --version 2>&1 | grep -q 'GNU coreutils'; then
	# Confirm when deleting 3 or more files
	alias rm='rm -I'
else
	# Confirm when deleting all files
	alias rm='rm -i'
fi

# Send 4 pings instead of an infinite number
alias ping='ping -c4'

# Use colordiff, if available
if command -v colordiff > /dev/null; then
	alias diff='colordiff'
fi
