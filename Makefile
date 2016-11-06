PHONY: packages

DEFAULT_TARGET: all

packages:
	brew tap homebrew/bundle
	brew bundle

symlink:
	ln -f -s "$(shell pwd)/bashrc" "$(HOME)/.bashrc"
	ln -f -s "$(shell pwd)/bash_profile" "$(HOME)/.bash_profile"
	ln -f -s "$(shell pwd)/myrc" "$(HOME)/.myrc"

all: symlink packages
