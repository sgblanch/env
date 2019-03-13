#!/bin/bash

# Add ~/bin to PATH
[[ -d "$HOME/bin" ]] && prepend_dir PATH "$HOME/bin"

# Add ~/.local/bin to PATH
[[ -d "$HOME/.local/bin" ]] && prepend_dir PATH "$HOME/.local/bin"

export PATH
