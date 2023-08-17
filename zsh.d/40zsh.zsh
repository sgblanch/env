#!/bin/zsh

# Don't put duplicate lines in the history. See zshoptions(1) for more options
setopt histignorealldups

# Append to the history file, don't overwrite it
setopt appendhistory
setopt incappendhistory

# Share history between terminals
setopt sharehistory

typeset -U PATH path

# Set the number of commands zsh should remember
HISTSIZE=1000
SAVEHIST=1000
