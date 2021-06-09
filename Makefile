.PHONY: packages symlink karabiner-config shell

DEFAULT_TARGET: all

# packages:
# 	brew tap homebrew/bundle
# 	brew bundle

symlink:
	ln -f -s "$(shell pwd)/gitconfig" "$(HOME)/.gitconfig"
	ln -f -s "$(shell pwd)/vim" "$(HOME)/.vim"
	ln -f -s "$(shell pwd)/vimrc" "$(HOME)/.vimrc"
	ln -f -s "$(shell pwd)/bin" "$(HOME)/"

karabiner-config:
	rm -rf ~/.config/karabiner
	mkdir -p ~/.config
	ln -f -s "$(shell pwd)/karabiner" $(HOME)/.config/karabiner

all: symlink karabiner-config packages

shell:
	chsh -s `which zsh`
