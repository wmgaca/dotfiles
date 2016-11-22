PHONY: packages

DEFAULT_TARGET: all

packages:
	brew tap homebrew/bundle
	brew bundle

symlink:
	ln -f -s "$(shell pwd)/bashrc" "$(HOME)/.bashrc"
	ln -f -s "$(shell pwd)/bash_profile" "$(HOME)/.bash_profile"
	ln -f -s "$(shell pwd)/myrc" "$(HOME)/.myrc"
	ln -f -s "$(shell pwd)/gitconfig" "$(HOME)/.gitconfig"
	ln -f -s "$(shell pwd)/vim" "$(HOME)/.vim"
	ln -f -s "$(shell pwd)/vimrc" "$(HOME)/.vimrc"
	ln -f -s "$(shell pwd)/bin" "$(HOME)/bin"
	ln -f -s "$(shell pwd)/secretrc" "$(HOME)/.secretrc"

all: symlink packages
