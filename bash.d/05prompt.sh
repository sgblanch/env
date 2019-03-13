#!/bin/bash

########################################################################
# Send a title to Xterm and screen using your prompt.  This also will
# work with tmux
#
# Title is in the form:
#     "user ~/dir"
########################################################################
send_title() {
	local xterm='\e]2;\u \w\a'
	local screen='\ek\u \w\e\\'

	case "${TERM}" in
		xterm*)
			PS1="\[${xterm}\]${PS1}"
			;;
		screen)
			PS1="\[${xterm}${screen}\]${PS1}"
			;;
	esac
}

########################################################################
# Allow user to pick from a number of common prompt formats.
#
# Cool Feature: This function is left in your environment.  Try it!
########################################################################
prompt() {
	case "$1" in
		debian)
			# user@host:/path$
			PS1='\u@\h:\w\$ '
			;;
		osx|macos)
			# host:dir user$
			PS1='\h:\W \u\$ '
			;;
		redhat)
			# [user@host dir]$
			PS1='[\u@\h \W]\$ '
			;;
		user)
			# user$
			PS1='\u\$ '
			;;
		host)
			# host$
			PS1='\h\$ '
			;;
		basic)
			# $
			PS1='\$ '
			;;
		*)
			# default is 'debian'
			PS1='\u@\h:\w\$ '
			;;
	esac

	send_title
}
