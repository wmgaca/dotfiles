PHONY: packages

DEFAULT_TARGET: all

packages:
	brew tap homebrew/bundle
	brew bundle

symlink:
	@echo symlink

all: symlink packages
