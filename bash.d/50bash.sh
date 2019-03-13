#!/bin/bash

# Don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set the number of commands bash should remember
HISTSIZE=1000

# Add timestamps to your history. Format below is
# YYYY-MM-DD HH:MM:SS (24-hour)
HISTTIMEFORMAT='%F %T '

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
