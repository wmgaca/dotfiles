export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin

if [ -f ~/.bashrc ]
then
    source ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]
then
    . $(brew --prefix)/etc/bash_completion
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#eval "$(docker-machine env default)"
