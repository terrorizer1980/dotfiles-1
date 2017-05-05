"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/

" Loads all valid config files in a `directory`.
" https://github.com/christoomey/dotfiles/blob/master/vim/vimrc
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

" Set character encoding.
set encoding=utf-8

" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')
call s:SourceConfigFilesIn('plugrc')
" TODO These need to be moved into their own files
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

" Enable the native filetype plugin
filetype plugin on

" Set colorscheme.
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }
let macvim_skip_colorscheme=1
highlight SignColumn guibg=#1D1D1D

" Set wildcard ignores.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Always change to dir of current file
autocmd BufEnter * silent! lcd %:p:h
