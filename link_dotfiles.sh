#!/bin/bash

link ()
{
  orig="${HOME}/dotfiles/$1"
  dest="${2:-${HOME}}/$1"
  echo "Linking $orig to $dest"
  ln -fs $orig $dest
}

# Set defaults
d_vim="y"
d_zsh="y"
d_prezto="y"
d_tmux="y"
d_Slate="n"
d_X="n"

# Get user choices
echo -n "Link Vim config? (Y/n) "
read vim
[ -z "$vim" ] && vim=$d_vim

echo -n "Link Zsh config? (Y/n) "
read zsh
[ -z "$zsh" ] && zsh=$d_zsh

echo -n "Link Prezto configs? (Y/n) "
read prezto
[ -z "$prezto" ] && prezto=$d_prezto

echo -n "Link tmux config? (Y/n) "
read tmux
[ -z "$tmux" ] && tmux=$d_tmux

echo -n "Link Slate config? (y/N) "
read slate
[ -z "$slate" ] && slate=$d_slate

echo -n "Link X configs? (y/N) "
read x
[ -z "$x" ] && x=$d_x

# Link the chosen files
[ "$vim" == "y" ] && link ".vimrc"

[ "$zsh" == "y" ] && link ".zshrc"

if [ "$prezto" == "y" ]; then
  link ".zpreztorc"
  link "prompt_ngscheurich_setup" "${HOME}/.zprezto/modules/prompt/functions" 
fi

[ "$tmux" == "y" ] && link ".tmux.conf"

[ "$slate" == "y" ] && link ".slate.js"

if [ "$x" == "y" ]; then
  link ".xinitrc"
  link ".Xresources"
fi

