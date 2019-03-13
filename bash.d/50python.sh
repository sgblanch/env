#!/bin/bash

# Add python's user bin directory to PATH
for python in python2 python3 python; do
	if command -v "${python}" >/dev/null && [[ -d "$("${python}" -m site --user-base)/bin" ]] ; then
		prepend_dir PATH "$("${python}" -m site --user-base)/bin:$PATH"
	fi
done

export PATH
