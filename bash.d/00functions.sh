#!/bin/bash

# Convience function to prepend a directory onto a PATH-like variable.
# usage: prepend_dir PATH /dir/to/prepend
prepend_dir() {
	eval CUR="\${$1:-}"
	if [[ -d "$2" ]] && [[ ! "${CUR:-}" =~ "(^|:)$2($|:)" ]]; then
		eval $1="$2${CUR:+\:${CUR}}"
	fi
}

# Convience function to append a directory onto a PATH-like variable.
# usage: append_dir PATH /dir/to/append
append_dir() {
	eval CUR="\${$1:-}"
	if [[ -d "$2" ]] && [[ ! "${CUR:-}" =~ "(^|:)$2($|:)" ]]; then
		eval $1="${CUR:+${CUR}\:}$2"
	fi
}
