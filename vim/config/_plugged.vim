" ==============================================================================
" A Book of Magic Spells
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Last added:
" nerdtree
" devicons
" gutentags
"
" P tagbar

" Plug 'edkolev/tmuxline.vim'           " Simple tmux statusline generator

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/denite.nvim',             " Dark powered plugin to unite all interfaces
    \{ 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim',           " Dark powered asynchronous completion framework
    \{ 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', " Language Server Protocol (LSP) support
    \{ 'branch': 'next',
    \  'do': 'bash install.sh' }
Plug 'csexton/trailertrash.vim'        " Identify and irradicate unwanted EOL whitespace
Plug 'janko-m/vim-test'                " Run your tests at the speed of thought
Plug 'junegunn/goyo.vim'               " Distraction-free writing
Plug 'junegunn/limelight.vim'          " Hyper-focused writing
Plug 'justinmk/vim-sneak'              " Jump to any location specified by two characters
Plug 'ludovicchabant/vim-gutentags'    " Manages/updates tag files
Plug 'machakann/vim-highlightedyank'   " Make the yanked region apparent
" Plug 'majutsushi/tagbar'               " Displays tags in a window, ordered by scope
Plug 'maxmellon/vim-jsx-pretty'        " JSX syntax highlighting
Plug 'mhartington/nvim-typescript',    " Typescript tooling
    \{'do': './install.sh'}
Plug 'mhinz/vim-startify'              " Fancy start screen
Plug 'morhetz/gruvbox'                 " Retro groove color scheme
Plug 'prettier/vim-prettier',          " Integrate Prettier
    \{'do': 'yarn install' }
Plug 'reedes/vim-pencil'               " Rethinking Vim as a tool for writers
Plug 'ryanoasis/vim-devicons'          " Add file type glyphs/icons to popular Vim plugins
Plug 'scrooloose/nerdtree'             " File tree explorer
Plug 'sheerun/vim-polyglot'            " On-demand language support
Plug 'slashmili/alchemist.vim'         " Elixir integration
Plug 'srcery-colors/srcery-vim'        " Srcerous colors
Plug 'tpope/vim-abolish'               " Operate on variants of a word (plural, case, etc.)
Plug 'tpope/vim-commentary'            " Toggle comments
Plug 'tpope/vim-dispatch'              " Perform async tasks in a tmux split
Plug 'tpope/vim-endwise'               " End coding structures automatically, e.g., `do`...`end`
Plug 'tpope/vim-fugitive'              " Git integration
Plug 'tpope/vim-sensible'              " Defaults everyone can agree on
Plug 'tpope/vim-sleuth'                " Heuristically set buffer indentation options
Plug 'tpope/vim-speeddating'           " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'              " Operate on, e.g., parentheses, brackets, quotes
Plug 'tpope/vim-unimpaired'            " Complementary key mappings based around [ and ]
Plug 'tpope/vim-vinegar'               " Navigate up a directory in netrw
Plug 'vim-airline/vim-airline'         " Lean and mean status/tab line
Plug 'w0rp/ale'                        " Asynchronous linter/fixer with LSP integration
Plug 'webdevel/tabulous'               " Enhance the tab line
call plug#end()
