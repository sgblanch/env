#!/bin/bash

# Add common user bin directories to PATH
prepend_dir PATH "$HOME/bin"
prepend_dir PATH "$HOME/.local/bin"

export PATH
