#!/bin/bash

# If we are running in TMUX, push PATH into tmux's global environment
#[[ -n "${TMUX:-}" ]] && tmux setenv -g PATH "$PATH" > /dev/null 2>&1
