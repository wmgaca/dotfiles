PHONY: packages symlink karabiner-config fish

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
	ln -f -s "$(shell pwd)/bin" "$(HOME)/"

karabiner-config:
	rm -rf ~/.config/karabiner
	mkdir -p ~/.config
	ln -f -s "$(shell pwd)/karabiner" $(HOME)/.config/karabiner

all: symlink karabiner-config packages

fish:
	@sudo echo "$(which fish)" > /etc/shells
	# chsh -s $((which fish))