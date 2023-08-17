#!/bin/zsh

# Find GOROOT, preferring homebrew's go installation over golang.org's
# install pkg
for dir in "${HOMEBREW_PREFIX:-/usr/local}/opt/go/libexec" /usr/local/go; do
	if [[ -d "${dir}" ]]; then
		export GOROOT="${dir}"
		break
	fi
done

# Add commom-ish source directories to GOPATH
if [[ -n "${GOROOT:-}" ]]; then
	typeset -U -T GOPATH gopath
	for dir in "${HOME}/go" "${HOME}/src"; do
		gopath+=("${dir}")
		path=("${dir}/bin" $path)
	done

	export GOPATH PATH
fi
