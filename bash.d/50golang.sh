#!/bin/bash

# Find GOROOT, preferring homebrew's go installation over golang.org's
# install pkg
for dir in "$(brew --prefix)/opt/go/libexec" /usr/local/go; do
	if [[ -d "${dir}" ]]; then
		export GOROOT="${dir}"
		#prepend_dir PATH "${GOROOT}"

		break
	fi
done

# Add commom-ish source directories to GOPATH
if [[ -n "${GOROOT:-}" ]]; then
	for dir in "${HOME}/go" "${HOME}/src/go"; do
		append_dir GOPATH "${dir}"
		prepend_dir PATH "${dir}/bin"
	done

	export GOPATH PATH
fi
