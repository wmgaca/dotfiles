export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -f "$HOME/.bashrc" ]
then
    source "$HOME/.bashrc"
fi

if [ -f "$(brew --prefix)/etc/bash_completion" ]
then
    source "$(brew --prefix)/etc/bash_completion"
fi

# if [ -f "$HOME/.secretrc" ]
# then
#     source "$HOME/.secretrc"
# fi

if [ "$(which direnv)" != "" ]
then
    eval "$(direnv hook bash)"
fi

# [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
# if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#   export GPG_AGENT_INFO
# else
#   eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
# fi

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"