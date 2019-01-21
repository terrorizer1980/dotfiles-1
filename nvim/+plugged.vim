" =============================================================================================
" A Book of Magic Spells
" =============================================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

call plug#begin('~/.local/share/nvim/plugged')

" User interface
" ---------------------------------------------------------------------------------------------

Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'caksoylar/vim-mysticaltutor'
Plug 'vim-airline/vim-airline-themes'

Plug 'drewtempelmeyer/palenight.vim'  " Soothing colorscheme
Plug 'edkolev/tmuxline.vim'           " Simple tmux statusline generator
Plug 'kaicataldo/material.vim'        " A dark colorscheme based on the Material color scheme
Plug 'mhinz/vim-startify'             " Fancy start screen
Plug 'morhetz/gruvbox'                " Retro groove colorscheme
Plug 'rakr/vim-one'                   " Port of Atom's famous One Dark scheme
Plug 'rakr/vim-togglebg'              " Easily toggle background color
Plug 'rakr/vim-two-firewatch'         " A blend between Duotone Light and Firewatch for Atom
Plug 'ryanoasis/vim-devicons'         " Add file type glyphs/icons to popular Vim plugins
Plug 'srcery-colors/srcery-vim'       " An arcane colorscheme
Plug 'tomasr/molokai'                 " A simple, classic colorscheme
Plug 'vim-airline/vim-airline'        " Lean and mean status/tab line

" Languages and frameworks
" ---------------------------------------------------------------------------------------------
Plug 'avdgaag/vim-phoenix'            " Conveniences for Phoenix projects
Plug 'HerringtonDarkholme/yats.vim'   " Typescript syntax highlighting
Plug 'mhartington/nvim-typescript',   " Typescript tooling
    \{'do': './install.sh'}
Plug 'sheerun/vim-polyglot'           " On-demand language support
Plug 'slashmili/alchemist.vim'        " Elixir integration
Plug 'maxmellon/vim-jsx-pretty'       " JSX syntax highlighting
Plug 'carlitux/deoplete-ternjs'       " Deoplete source for Tern

" Code tools
" ---------------------------------------------------------------------------------------------
Plug 'Shougo/deoplete.nvim',          " Dark powered asynchronous completion framework
    \{ 'do': ':UpdateRemotePlugins' }
Plug 'janko-m/vim-test'               " Run your tests at the speed of thought
" Plug 'ludovicchabant/vim-gutentags'   " Manages/updates tag files
Plug 'majutsushi/tagbar'              " Navigate files by tags
Plug 'pbogut/deoplete-elm'            " Deoplete source for Elm powered by Elm Oracle
Plug 'w0rp/ale'                       " Asynchronous linter/fixer with LSP integration

" Utility
" --------------------------------------------------------------------------------------------
Plug '/usr/local/opt/fzf'             " Location of fzf binary
Plug 'csexton/trailertrash.vim'       " Identify and irradicate unwanted EOL whitespace
Plug 'junegunn/fzf.vim'               " Integrate with fzf
Plug 'justinmk/vim-sneak'             " Jump to any location specified by two characters
Plug 'scrooloose/nerdtree'            " File tree explorer
Plug 'tpope/vim-abolish'              " Operate on variants of a word (plural, case, etc.)
Plug 'tpope/vim-commentary'           " Toggle comments
Plug 'tpope/vim-dispatch'             " Perform async tasks in a tmux split
Plug 'tpope/vim-endwise'              " End coding structures automatically, e.g., `do`...`end`
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'tpope/vim-sensible'             " Defaults everyone can agree on
Plug 'tpope/vim-sleuth'               " Heuristically set buffer indentation options
Plug 'tpope/vim-speeddating'          " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'             " Operate on, e.g., parentheses, brackets, quotes
Plug 'tpope/vim-unimpaired'           " Complementary key mappings based around [ and ]
Plug 'tpope/vim-vinegar'              " Navigate up a directory in netrw
Plug 'prettier/vim-prettier',         " Integrate Prettier
    \{'do': 'yarn install' }

call plug#end()
