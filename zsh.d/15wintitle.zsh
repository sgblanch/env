#!/bin/zsh

case "${TERM}" in
	xterm*)
		# $'\e]0;...\a' # set xterm window and icon (tab) name
		# $'\e]1;...\a' # set xterm icon (tab) name
		# $'\e]2;...\a' # set xterm window name
		# $'\e]6;...\a' # working document as file://host/path/file *
		# $'\e]7;...\a' # working directory as file://host/path/dir/ *
		#     * url-encoded
		precmd() { print -Pn $'%{\e]2;%n %~\a%}'; }
		;;
	screen*|tmux*)
		# $'\ePtmux;...\a\e\\' # pass control sequence to xterm
		# $'\ek...\e\\'      # set tmux window name
		precmd() { print -Pn $'\ePtmux;\e\e]2;%n %~\a\e\\' $'%{\ek%n %~\e\\%}'; }
		;;
esac
