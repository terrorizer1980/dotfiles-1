" My Vim configuration. There be dragons here.
" — Nick

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

" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline-themes'        " Colorschemes for the statusline
Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'posva/vim-vue'
call s:SourceConfigFilesIn('plugrc')
call plug#end()

" Set character encoding.
set encoding=utf-8

" Enable the native filetype plugin
filetype plugin on

" Set colorscheme.
set background=dark                          " Use light-on-dark colors
colorscheme hybrid_material                  " Use hybrid_material colorscheme

" Set wildcard ignores.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

call s:SourceConfigFilesIn('vimrc')
