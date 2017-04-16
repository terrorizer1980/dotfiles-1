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
      echom config_file
      execute 'source' config_file
    endif
  endfor
endfunction

" Set character encoding.
set encoding=utf-8

" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')
call s:SourceConfigFilesIn('plugrc')
call plug#end()

" Enable the native filetype plugin
filetype plugin on

" Set colorscheme.
set background=dark                          " Use light-on-dark colors
colorscheme hybrid_material                  " Use hybrid_material colorscheme

" Set wildcard ignores.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" All other Vim settings
call s:SourceConfigFilesIn('vimrc')
