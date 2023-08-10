#!/bin/bash

# Modern OSes are astonishingly good at automatically populating your MANPATH
if command -v manpath > /dev/null 2>&1; then
	unset MANPATH
	MANPATH="$(manpath)"
	export MANPATH
fi
