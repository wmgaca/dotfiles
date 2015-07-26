# dotfiles

## Install

    git clone https://github.com/wmgaca/dotfiles.git ~/your/dotfiles/directory
    cd ~/your/dotfiles/directory
    /install

## How does it work?

All files are symlinked instead of being physically moved, as a result you'll get:

    ~/.bashrc -> ~/your/dotfiles/directory/.bashrc.symlink
    ~/bin -> ~/your/dotfiles/directory/bin.symlink
    ...

## Thanks

Credits, greets and cheers go to [Zach Holman](https://github.com/holman) whose [dotfiles](https://github.com/holman/dotfiles) inspired me in the first place.