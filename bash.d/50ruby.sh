#!/bin/bash

# add ruby's user gems bin directory to PATH
if [[ -d "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin" ]]; then
	prepend_dir PATH "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
	export PATH
fi
