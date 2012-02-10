# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

unset HISTFILESIZE
export HISTSIZE=9999

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export EDITOR="vim"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s progcomp

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

export PS1='\[\e[01;32m\]andrew\[\e[01;3$(($RANDOM % 8))m\]@\[\e[01;32m\]money \[\e[01;31m\]\w \[\e[01;33m\]$\[\e[0m\] '

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
   alias ls='ls --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# See /home/ajcrites/.bash_aliases
source ~/.bash_aliases

# See /home/ajcrites/.bash_functions
source ~/.bash_functions

# have a nice less: caseInsesitive, line numbers
export LESS="-I -R -M --shift=5"
export LESSOPEN="|lesspipe %s"

# don't duplicate paths
export PATH=$PATH:~/bin
export PATH=$(echo "$PATH" |tr ':' '\n' | sort -u | sed '/^\s*$/d' | tr '\n' ':')
export MANPATH=$MANPATH:~/man
export MANPATH=$(echo "$MANPATH" |tr ':' '\n' | sort -u | sed '/^\s*$/d' | tr '\n' ':')