#!/bin/bash

# Add python's user bin directory to PATH
if command -v python3 >/dev/null; then
	prepend_dir PATH "$("${python}" -m site --user-base)/bin"
fi

export PATH
