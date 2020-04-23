#!/usr/bin/env bash
export GOPATH="$HOME/dev/go"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$GOPATH/bin"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$PATH:$HOME/dev/flutter/bin"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Set up ssh-agent
SSH_ENV="$HOME/.ssh/environment"

# function start_agent {
#     touch $SSH_ENV
#     chmod 600 "${SSH_ENV}"
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' >> "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add
# }
#
# # Source SSH settings, if applicable
# if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     kill -0 $SSH_AGENT_PID 2>/dev/null || {
#         start_agent
#     }
# else
#     start_agent
# fi
#
# if [ ! -z "$(which gtar)" ]; then
#     alias tar=gtar
# fi

if [ -f $HOME/.myrc ]; then
    source $HOME/.myrc
fi

# if [ -f $HOME/.secretrc ]; then
#     source $HOME/.secretrc
# fi
