scriptencoding utf-8

" ----------------------------------------------------------
" Neovim configuration
" ----------------------------------------------------------
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo:   https://github.com/ngscheurich/dotfiles

source $HOME/.config/nvim/plugins.vim

let s:plugin_configs = '~/.config/nvim/plugins/*.vim'
for file in split(glob(s:plugin_configs), '\n')
    exe 'source' file
endfor

source $HOME/.config/nvim/global.vim
source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/commands.vim
