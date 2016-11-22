export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin

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

if [ -f "$HOME/.secretrc" ]
then
    source "$HOME/.secretrc"
fi

if [ "$(which direnv)" != "" ]
then
    eval "$(direnv hook bash)"
fi
