#!/bin/zsh

for dir in "${HOME}/.composer/vendor/bin" "${HOME}/.local/composer/vendor/bin"; do
	[[ -d "${dir}" ]] && path=("${dir}" $path)
done
