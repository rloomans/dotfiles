#! /usr/bin/env bash

if ! hash dotfiles 2>/dev/null; then
    echo 'Installing dotfiles (needs pip)'
    sudo pip install dotfiles
fi

cd ~/.dotfiles

git pull origin master

# pull submodules (used for git plugins)
git submodule init
git submodule update

dotfiles -s
