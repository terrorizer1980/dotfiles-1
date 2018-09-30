" Initializes plugins
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles


call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'                  " Shows a git diff in the sign column and stages/undoes hunks
Plug 'edkolev/tmuxline.vim'                    " vim-airline-like status bar for tmux
Plug 'HerringtonDarkholme/yats.vim'            " TypeScript syntax highlighting
Plug 'MaxMEllon/vim-jsx-pretty'                " React JSX syntax pretty highlighting
Plug 'Shougo/deoplete.nvim'                    " Asynchronous completion framework
Plug 'alvan/vim-closetag'                      " Automatically close (X)HTML tags
Plug 'csexton/trailertrash.vim'                " Deal with EOL whitespace
Plug 'dietsche/vim-lastplace'                  " Open files where you left them
Plug 'djoshea/vim-autoread'                    " Reload buffers whose files have been modified
Plug 'editorconfig/editorconfig-vim'           " EditorConfig support
Plug 'elixir-lang/vim-elixir'                  " Elixir syntax highlihting and indentation
Plug 'itmammoth/doorboy.vim'                   " Auto closing brackets
Plug 'jreybert/vimagit'                        " Ease your git workflow within Vim
Plug 'justinmk/vim-sneak'                      " Jump to any location specified by two characters
Plug 'ludovicchabant/vim-gutentags'            " Manages tag files
Plug 'majutsushi/tagbar'                       " Display tags in a window, ordered by scope
Plug 'mhartington/nvim-typescript',            " TypeScript tooling for Neovim
            \ {'do': './install.sh'}
Plug 'mhartington/oceanic-next'                " Colorscheme inspired by Oceanic Next for Sublime
Plug 'mhinz/vim-mix-format'                    " Run the Elixir formatter asynchronously
Plug 'mhinz/vim-startify'                      " Fancy start screen
Plug 'pangloss/vim-javascript'                 " Improved JavaScript indentation and syntax highlighting
Plug 'prettier/vim-prettier',                  " Integrate with Prettier
            \ { 'do': 'yarn install' }
Plug 'RRethy/vim-illuminate'                   " Highlight instances of word under the cursor
Plug 'ryanoasis/vim-devicons'                  " Icons in status bar, NERDTree, etc.
Plug 'scrooloose/nerdtree'                     " Project tree drawer
Plug 'srcery-colors/srcery-vim'                " Color scheme with clearly defined contrasting colors and a slightly earthy tone
Plug 'Shougo/denite.nvim'                      " Unite all interfaces
Plug 'Shougo/deoplete.nvim',                   " Asynchronous completion framework
            \ { 'do': ':UpdateRemotePlugins' }
Plug 'simnalamburt/vim-mundo'                  " Undo tree visualizer
Plug 'slashmili/alchemist.vim'                 " Elixir integration via ElixirSense
Plug 'terryma/vim-multiple-cursors'            " Sublime Text style multiple selections
Plug 'thoughtbot/vim-rspec'                    " RSpec integration
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Colored devicons
Plug 'tpope/vim-abolish'                       " Operate on variants of a word (plural, case, etc.)
Plug 'tpope/vim-commentary'                    " Toggle comments
Plug 'tpope/vim-dispatch'                      " Perform async tasks in a tmux split
Plug 'tpope/vim-endwise'                       " End coding structures automatically, e.g., `do`...`end`
Plug 'tpope/vim-fugitive'                      " Git integration
Plug 'tpope/vim-projectionist'                 " Project configuration and navigation commands
Plug 'tpope/vim-rails'                         " Ruby on Rails power tools
Plug 'tpope/vim-sensible'                      " Defaults everyone can agree on
Plug 'tpope/vim-sleuth'                        " Heuristically set buffer indentation options
Plug 'tpope/vim-speeddating'                   " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'                      " Operate on surroundings, e.g., parentheses, brackets, quotes
Plug 'tpope/vim-unimpaired'                    " Complementary key mappings based around [ and ]
Plug 'tpope/vim-vinegar'                       " Navigate up a directory in netrw
Plug 'vim-airline/vim-airline'                 " Fancy status bar
Plug 'w0rp/ale'                                " Asynchronous Lint Engine

call plug#end()

