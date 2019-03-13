#!/bin/bash

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# source individual bashrc snippets from ~/bash.d/
for file in ~/.bash.d/*.sh; do
	[[ -r "${file}" ]] && . "${file}"
done
