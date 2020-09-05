scriptencoding utf-8

" ----------------------------------------------------------
" Neovim configuration
" ----------------------------------------------------------
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo:   https://github.com/ngscheurich/dotfiles

source $HOME/.config/nvim/packages.vim

source $HOME/.config/nvim/config/global.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/commands.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/colors.vim

let s:plugin_configs = '~/.config/nvim/config/plugins/*.vim'
for file in split(glob(s:plugin_configs), '\n')
    exe 'source' file
endfor

lua require'colorizer'.setup()
