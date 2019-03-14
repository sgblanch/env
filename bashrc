#!/bin/bash

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# Source system bashrc and individual bashrc snippets from ~/bash.d/
for file in /etc/bashrc ~/.bash.d/*.sh; do
	[[ -r "${file}" ]] && . "${file}"
done
