#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/zsh ~/.zsh

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/tmux ~/.tmux

# Xresources
ln -s ${BASEDIR}/Xresources ~/.Xresources

# dircolors
ln -s ${BASEDIR}/dircolors ~/.dircolors

#tmuxifier
ln -s ${BASEDIR}/tmuxifier ~/.tmuxifier
