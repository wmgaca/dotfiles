#!/usr/bin/env bash

export GOPATH="$HOME/dev/go"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$GOPATH/bin"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_info() {
  local g="$(git rev-parse --git-dir 2>/dev/null)"
  if [ -n "$g" ]; then
    local r
    local b
    if [ -d "$g/../.dotest" ]
    then
      if test -f "$g/../.dotest/rebasing"
      then
        r="|REBASE"
      elif test -f "$g/../.dotest/applying"
      then
        r="|AM"
      else
        r="|AM/REBASE"
      fi
      b="$(git symbolic-ref HEAD 2>/dev/null)"
    elif [ -f "$g/.dotest-merge/interactive" ]
    then
      r="|REBASE-i"
      b="$(cat "$g/.dotest-merge/head-name")"
    elif [ -d "$g/.dotest-merge" ]
    then
      r="|REBASE-m"
      b="$(cat "$g/.dotest-merge/head-name")"
    elif [ -f "$g/MERGE_HEAD" ]
    then
      r="|MERGING"
      b="$(git symbolic-ref HEAD 2>/dev/null)"
    else
      if [ -f "$g/BISECT_LOG" ]
      then
        r="|BISECTING"
      fi
      if ! b="$(git symbolic-ref HEAD 2>/dev/null)"
      then
        if ! b="tag: $(git describe --exact-match HEAD 2>/dev/null)"
        then
          b="$(cut -c1-7 "$g/HEAD")..."
        fi
      fi
    fi

    if [ -n "$1" ]; then
      printf "$1" "${b##refs/heads/}$r"
    else
      printf " (%s)" "${b##refs/heads/}$r"
    fi
  fi
}

PS1='\n\[$(tput setaf 6)\]\[$(tput bold)\]\w\[$(tput setaf 5)\]$(git_info)\[$(tput setaf 7)\] \[$(tput sgr0)\]\n$ '

if [ -f $HOME/.myrc ]; then
    source $HOME/.myrc
fi

if [ -f $HOME/.secretrc ]; then
    source $HOME/.secretrc
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

alias tmux="TERM=screen-256color-bce tmux"
# Solarized stuff
export TERM="xterm-256color"

# Set up ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    touch $SSH_ENV
    chmod 600 "${SSH_ENV}"
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >> "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    kill -0 $SSH_AGENT_PID 2>/dev/null || {
        start_agent
    }
else
    start_agent
fi

alias tar=gtar
