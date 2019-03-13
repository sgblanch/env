#!/bin/bash

# ~/.bash_logout: executed by bash(1) when login shell exits.

# Destroy Kerberos tickets if user has no other sessions open
count=`w -h ${USER} | wc -l`
if [[ ${count:-0} -le 1 ]] && klist -s; then
	kdestroy
fi

# when leaving the console clear the screen to increase privacy
[[ "$SHLVL" = 1 ]] && [[ -x /usr/bin/clear_console ]] && /usr/bin/clear_console -q
