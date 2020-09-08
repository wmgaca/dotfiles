set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/Users/wmgaca/dev/flutter/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# suppress greeting message on new session
set fish_greeting

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lhFG'
alias lla='ls -AlhFG'
alias ..='cd ..'

alias gd='git diff'
alias gdc='gd --cached'
alias gs='git status -sb'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gco='git checkout'
alias gb='git branch'
alias gfa='git fetch --all'
alias gg='git grep --break --heading --line-number'

alias kc='kubectl --namespace=midge'
alias kctx='kubectx -'

eval (direnv hook fish)
