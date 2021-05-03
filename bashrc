# .bashrc
# References:
# - https://github.com/mrzool/bash-sensible
# - https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob


## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# User specific aliases and functions

if [ -f $HOME/.aliases ]; then
	. $HOME/.aliases
fi


if [ -f $HOME/.custom-path.sh ]; then
	. $HOME/.custom-path.sh
fi

export PATH=$HOME/bin:$PATH

if [ -f $HOME/.git-prompt.sh ]; then
	. $HOME/.git-prompt.sh
	export GIT_PS1_SHOWDIRTYSTATE=1
	export PS1='\w$(__git_ps1 " (%s)")\$ '
fi

. "$HOME/.cargo/env"
