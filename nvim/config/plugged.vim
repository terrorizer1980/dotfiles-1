" Plugin definitions
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

call plug#begin('~/.local/share/nvim/plugged')"
" UI niceities {{{
Plug 'airblade/vim-gitgutter'                  " Display file changes in the sign column
Plug 'edkolev/tmuxline.vim'                    " vim-airline-like status bar for tmux
Plug 'jacoborus/tender.vim'                    " My colorscheme of choice
Plug 'joshdick/onedark.vim'                    " Another nice colorscheme
Plug 'majutsushi/tagbar'                       " Tag navigation bar
Plug 'mhinz/vim-startify'                      " Fancy start screen
Plug 'ryanoasis/vim-devicons'                  " Icons in status bar, NERDTree, etc.
Plug 'scrooloose/nerdtree'                     " Project tree drawer
Plug 'sjl/gundo.vim'                           " Undo tree visualizer
Plug 'szw/vim-maximizer'                       " Maximize/restore current window
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Colored devicons
Plug 'rakr/vim-two-firewatch'                  " My preferred colorscheme
Plug 'vim-airline/vim-airline'                 " Fancy status bar

Plug 'Erichain/vim-monokai-pro'
Plug 'challenger-deep-theme/vim'
Plug 'nightsense/vimspectr'
Plug 'gilgigilgil/anderson.vim'
Plug 'romainl/Apprentice'
Plug 'jdsimcoe/abstract.vim'
Plug 'andreasvc/vim-256noir'
" Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" }}} ----------------------------------------------------------------
" Languages and frameworks {{{
Plug 'alvan/vim-closetag'                      " Automatically close (X)HTML tags
Plug 'ElmCast/elm-vim'                         " Elm integration
Plug 'HerringtonDarkholme/yats.vim'            " TypeScript autocompletion
Plug 'alols/vim-love-efm'                      " Loads LÖVE errors into the quickfix list
Plug 'c-brenn/phoenix.vim'                     " Phoenix integration
Plug 'davisdude/vim-love-docs',                " Documentation for LÖVE
            \ { 'branch': 'build' }
Plug 'cespare/vim-toml'                        " TOML syntax highlighting
Plug 'elixir-lang/vim-elixir'                  " Elixir syntax highlihting and indentation
Plug 'justinj/vim-pico8-syntax'                " PICO-8 syntax support
Plug 'mattn/emmet-vim'                         " Expand abbreviations à la Emment
Plug 'mxw/vim-jsx'                             " JSX syntax support
Plug 'OmniSharp/omnisharp-vim'                 " C# code completion, definition jumping, etc.
Plug 'othree/html5.vim'                        " HTML5 omnicomplete and syntax
Plug 'mhinz/vim-mix-format'                    " Integrate Elixir’s formatter
Plug 'pangloss/vim-javascript'                 " Improved JavaScript indentation and syntax highlighting
Plug 'posva/vim-vue'                           " Syntax highlighting for Vue.js single file components
Plug 'slashmili/alchemist.vim'                 " Elixir integration via ElixirSense
Plug 'tbastos/vim-lua'                         " Improved Lua 5.3 syntax and indentation
Plug 'thoughtbot/vim-rspec'                    " RSpec integration
Plug 'tmux-plugins/vim-tmux'                   " Niceties for editing Tmux config files
Plug 'tpope/vim-projectionist'                 " Project file navigation; required for phoenix.vim
Plug 'tpope/vim-rails'                         " Ruby on Rails integration
Plug 'xolox/vim-lua-ftplugin'                  " Lua filetype plugin
Plug 'xolox/vim-misc'                          " Miscellaneous auto-load Vim scripts (req. for vim-lua-ftplugin)

" }}} ----------------------------------------------------------------
" Markdown and prose {{{
Plug 'junegunn/goyo.vim'                       " Distraction-free writing
Plug 'junegunn/limelight.vim'                  " Dim text that is not focused
Plug 'reedes/vim-pencil'                       " Tons of prose-related features
Plug 'robertbasic/vim-hugo-helper'             " Helpers for writing posts for Hugo
" }}} ----------------------------------------------------------------
" Completion {{{
Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/deoplete.nvim',
"             \ { 'do': ':UpdateRemotePlugins' } " Asynchronous completion framework
" }}} ----------------------------------------------------------------
" Utilities {{{
Plug '/usr/local/opt/fzf'                      " Location of fzf binary
Plug 'Rykka/colorv.vim'                        " Make working with colors easier
Plug 'djoshea/vim-autoread'                    " Reload buffers whose files have been modified
Plug 'abaldwin88/roamer.vim'                   " Manage files with roamer
Plug 'bogado/file-line'                        " Open files to a given line with file:lineno
Plug 'christoomey/vim-tmux-navigator'          " Navigate seamlessly between vim and tmux splits
Plug 'csexton/trailertrash.vim'                " Deal with EOL whitespace
Plug 'dietsche/vim-lastplace'                  " Open files where you left them
Plug 'editorconfig/editorconfig-vim'           " EditorConfig support
Plug 'godlygeek/tabular'                       " Easily align text
Plug 'jiangmiao/auto-pairs'                    " Automatically pair brackets, parens, and quotes
Plug 'junegunn/fzf.vim'                        " Integrate with fzf
Plug 'justinmk/vim-sneak'                      " Jump to any location specified by two characters
Plug 'ludovicchabant/vim-gutentags'            " Manage tag files
Plug 'mklabs/split-term.vim'                   " Utilites around Neovim’s :terminal
Plug 'prettier/vim-prettier',
            \ { 'do': 'yarn install' }         " Prettier integration
Plug 'powerman/vim-plugin-AnsiEsc'             " Deal with ANSI escape sequences
Plug 'roxma/vim-tmux-clipboard'                " Better Vim/Tmux clipboard interop
Plug 'tmux-plugins/vim-tmux-focus-events'      " Tmux compatibility fixes
Plug 'tpope/vim-abolish'                       " Operate on variants of a word (plural, case, etc.)
Plug 'tpope/vim-bundler'                       " Integrate with Bundler
Plug 'tpope/vim-commentary'                    " Toggle comments
Plug 'tpope/vim-dispatch'                      " Perform async tasks in a tmux split
Plug 'tpope/vim-endwise'                       " End coding structures automatically, i.e. `do`...`end`
Plug 'tpope/vim-fugitive'                      " Git integration
Plug 'tpope/vim-projectionist'                 " Project configuration
Plug 'tpope/vim-repeat'                        " Remap . in a way that plugins can tap into it
Plug 'tpope/vim-sensible'                      " Defaults everyone can agree on
Plug 'tpope/vim-sleuth'                        " Heuristically set buffer indentation options
Plug 'tpope/vim-speeddating'                   " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'                      " Operate on 'surroundings', e.g., parentheses, brackets, quotes
Plug 'tpope/vim-vinegar'                       " Navigate up a directory in netrw
Plug 'tpope/vim-unimpaired'                    " Complementary key mappings based around [ and ]
Plug 'vim-syntastic/syntastic'                 " Syntax checking hacks for vim
" }}} ----------------------------------------------------------------
" Local {{{
Plug '~/Projects/Misc/soft-era-vim'            " Light pastel syntax theme for cozy, cute coding
" }}}
call plug#end()

" vim:foldmethod=marker:foldlevel=0
