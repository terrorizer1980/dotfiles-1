#!/bin/sh

# Create config dir if necessary
mkdir ~/.tmux
rm -rf ~/.config/kitty

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/colors ~/.tmux/colors
ln -s ~/dotfiles/tool-versions ~/.tool-versions
ln -s ~/dotfiles/editorconfig ~/.editorconfig
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore_global ~/.gitignore_global

