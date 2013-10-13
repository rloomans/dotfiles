#! /usr/bin/env bash

if ! hash dotfiles 2>/dev/null; then
    echo 'Installing dotfiles (needs pip)'
    sudo pip install dotfiles
fi

cd ~/.dotfiles

git pull origin master

# one-time install of dotfilesrc
if [ ! -e ~/.dotfilesrc ]; then
    ln -s ~/.dotfiles/dotfilesrc ~/.dotfilesrc
fi

# update submodules (used for vim plugins)
git submodule init
git submodule update

dotfiles -s
