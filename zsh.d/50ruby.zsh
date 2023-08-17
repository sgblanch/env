#!/bin/zsh

# add ruby's user gems bin directory to PATH
if command -v ruby > /dev/null; then
	ruby_dir="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
	[[ -d "${ruby_dir}" ]] && path=("${ruby_dir}" $path)
fi
unset ruby_dir
