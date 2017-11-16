"
"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"
"
"
" Author: N. G. Scheurich
" Repo: https://github.com/ngscheurich/dotfiles



"" ======================================================
"" Plugins
"" ------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'                         " Some sensible defaults to start with


" UI niceities
" -------------------------------------------------------

Plug 'edkolev/tmuxline.vim'                    " vim-airline-like status bar for tmux
Plug 'jacoborus/tender.vim'                    " My colorscheme of choice
Plug 'majutsushi/tagbar'                       " Tag navigation bar
Plug 'mhinz/vim-startify'                      " Fancy start screen
Plug 'osyo-manga/vim-over'                     " Preview :substitute commands
Plug 'rakr/vim-one'                            " Another nice colorscheme
Plug 'ryanoasis/vim-devicons'                  " Icons in status bar, NERDTree, etc.
Plug 'scrooloose/nerdtree'                     " Project tree drawer
Plug 'sjl/gundo.vim'                           " Undo tree visualizer
Plug 'szw/vim-maximizer'                       " Maximize/restore current window
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Colored devicons
Plug 'vim-airline/vim-airline'                 " Fancy status bar


" Language and framework support
" -------------------------------------------------------

Plug 'carlitux/deoplete-ternjs'               " Autocompletion for JavaScript
  \ { 'build': 'npm install -g tern' }
Plug 'ElmCast/elm-vim'                        " Elm integration
Plug 'HerringtonDarkholme/yats.vim'           " TypeScript autocompletion
Plug 'alols/vim-love-efm'                     " LÖVE support
Plug 'c-brenn/phoenix.vim'                    " Phoenix integration
Plug 'cespare/vim-toml'                       " TOML syntax highlighting
Plug 'elixir-lang/vim-elixir'                 " Elixir syntax highlihting and indentation
Plug 'joukevandermaas/vim-ember-hbs'          " Ember Handlebars/HTMLBars
Plug 'justinj/vim-pico8-syntax'               " PICO-8 syntax support
Plug 'mattn/emmet-vim'                        " Expand abbreviations à la Emment
Plug 'mxw/vim-jsx'                            " JSX syntax support
Plug 'othree/html5.vim'                       " HTML5 omnicomplete and syntax
Plug 'pangloss/vim-javascript'                " Improved JavaScript indentation and syntax highlighting
Plug 'posva/vim-vue'                          " Syntax highlighting for Vue.js single file components
Plug 'slashmili/alchemist.vim'                " Elixir integration via ElixirSense
Plug 'thoughtbot/vim-rspec'                   " RSpec integration
Plug 'tmux-plugins/vim-tmux'                  " Niceties for editing Tmux config files
Plug 'tpope/vim-projectionist'                " Project file navigation; required for phoenix.vim
Plug 'tpope/vim-rails'                        " Ruby on Rails integration


" Markdown and prose
" -------------------------------------------------------

Plug 'junegunn/goyo.vim'                          " Distraction-free writing
Plug 'junegunn/limelight.vim'                     " Dim text that is not focused
Plug 'reedes/vim-pencil'                          " Tons of prose-related features
Plug 'robertbasic/vim-hugo-helper'                " Helpers for writing posts for Hugo


" Utilities
" -------------------------------------------------------

Plug 'Rykka/colorv.vim'                       " Make working with colors easier
Plug 'djoshea/vim-autoread'                   " Reload buffers whose files have been modified
Plug 'Shougo/neosnippet'                      " Support for snippets
Plug 'Shougo/neosnippet-snippets'             " Some basic snippets
Plug 'abaldwin88/roamer.vim'                  " Manage files with roamer
Plug 'airblade/vim-gitgutter'                 " Display file changes in the sign column
Plug 'bogado/file-line'                       " Open files to a given line with file:lineno
Plug 'christoomey/vim-tmux-navigator'         " Navigate seamlessly between vim and tmux splits
Plug 'csexton/trailertrash.vim'               " Deal with EOL whitespace
Plug 'dietsche/vim-lastplace'                 " Open files where you left them
Plug 'editorconfig/editorconfig-vim'          " EditorConfig support
Plug 'godlygeek/tabular'                      " Easily align text
Plug 'junegunn/fzf.vim'                       " Integrate with fzf
Plug 'justinmk/vim-sneak'                     " Jump to any location specified by two characters
Plug 'ludovicchabant/vim-gutentags'           " Manage tag files
Plug 'mklabs/split-term.vim'                  " Utilites around neovim’s :terminal
Plug 'powerman/vim-plugin-AnsiEsc'            " Deal with ANSI escape sequences
Plug 'roxma/vim-tmux-clipboard'               " Better Vim/Tmux clipboard interop
Plug 'svermeulen/vim-easyclip'                " Simplified clipboard functionality
Plug 'tmux-plugins/vim-tmux-focus-events'     " Tmux compatibility fixes
Plug 'tpope/vim-abolish'                      " Operate on variants of a word (plural, case, etc.)
Plug 'tpope/vim-bundler'                      " Integrate with Bundler
Plug 'tpope/vim-commentary'                   " Toggle comments
Plug 'tpope/vim-dispatch'                     " Perform async tasks in a tmux split
Plug 'tpope/vim-endwise'                      " End coding structures automatically, i.e. `do`...`end`
Plug 'tpope/vim-fugitive'                     " Git integration
Plug 'tpope/vim-projectionist'                " Project configuration
Plug 'tpope/vim-repeat'                       " Remap . in a way that plugins can tap into it
Plug 'tpope/vim-sleuth'                       " Heuristically set buffer indentation options
Plug 'tpope/vim-speeddating'                  " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'                     " Operate on 'surroundings', e.g., parentheses, brackets, quotes
Plug 'tpope/vim-vinegar'                      " Navigate up a directory in netrw
Plug 'tpope/vim-unimpaired'                   " Complementary key mappings based around [ and ]
Plug 'w0rp/ale'                               " Asynchronous Lint Engine

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()



"" ======================================================
"" General settings
"" ------------------------------------------------------

colorscheme tender                                      " Set colorscheme
filetype plugin on                                      " Enable the native filetype plugin
let g:netrw_banner=0                                    " No netrw banner
set autoindent                                          " Copy indent from current line when starting a new line
set backupcopy=yes                                      " Overwrites original file with backup; needed for webpack-dev-server HMR
set cursorline                                          " Highlight current line
set encoding=utf-8                                      " Set character encoding
set expandtab                                           " Insert proper amount of spaces in Insert mode
set fillchars+=vert:│                                   " Customize split borders
set guifont=Fira\ Code:h13	                            " Set font for GUI Vim
set ignorecase                                          " Ignore case when searching
set nobackup                                            " Don't keep backups around
set noshowmode                                          " Don't display editing mode below status bar (vim-airline shows this)
set noswapfile                                          " Don't use swapfiles
set nowritebackup                                       " Don't create a backup before writing a file
set number                                              " Show line numbers
set relativenumber                                      " Show relative line numbers
set shiftwidth=2                                        " Number of spaces to use for each step of (auto)indent
set signcolumn=yes                                      " Show signs to the left of line numbers
set smartcase                                           " Ignore case when searching lowercase
set smartindent                                         " Intelligently indent new lines
set smarttab                                            " Insert correct number of blanks on <Tab>; delete them on <BS>
set softtabstop=2                                       " Number of spaces that a <Tab> counts for while performing editing operations
set splitbelow                                          " Open horizontal splits below current window
set splitright                                          " Open vertical splits to the right of the current window
set tabstop=2                                           " Number of spaces that a <Tab> in the file counts for
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                " Set wildcard ignores

if (has("termguicolors"))
  set termguicolors                                     " Use 24-bit color if the terminal supports it
endif



"" ======================================================
"" Filetype-based settings
"" ------------------------------------------------------

autocmd BufNewFile,BufRead *.elm setlocal tabstop=4
autocmd BufNewFile,BufRead *.elm setlocal shiftwidth=4
autocmd BufNewFile,BufRead *.elm setlocal softtabstop=4

autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %



"" ======================================================
"" Keybindings
"" ------------------------------------------------------

" Map leader to comma
let mapleader = ","

" Open current file’s directory in Finder
nmap <Leader>d :!open %/..<CR>

" Switch to next/previous tab
nmap <Leader>h :tabprevious <CR>
nmap <Leader>l :tabnext <CR>

" Neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Stop highlighting search results on <ESC>
map <ESC> :noh<CR>

" Next/previous tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close window
nnoremap <F4> :close<CR>

" Quickly press jk to leave Insert mode
inoremap jk <ESC>

" Toggle maximized window
map <Leader>w :MaximizerToggle<CR>

" fzf.vim
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>/ :Ag<CR>

" vim-fugitive
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>
map <Leader>gl :Glog<CR>
map <Leader>gd :Gdiff<CR>

" Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" NERDTree
map <Leader>\ :NERDTreeToggle<CR>

" tagbar
nmap <Leader>t :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Enter cmdline mode with semicolon
nnoremap ; :

" ALE
nmap <silent> <Leader>e <Plug>(ale_next_wrap)

" Use <Tab> for autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" `make` current file
map <Leader>m :make<CR>
autocmd FileType pico8 map <Leader>m :!/Applications/PICO-8.app/Contents/MacOS/pico8 -run %<CR>

" Switch to JS/JSX filetype
map <Leader>jsx :set filetype=javascript.jsx<CR>

autocmd FileType ruby map <Leader>s :call RunCurrentSpecFile()<CR>



"" ======================================================
"" Plugin configuration
"" ------------------------------------------------------

" deoplete
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 0
autocmd CompleteDone * pclose

call deoplete#custom#set('buffer', 'mark', '')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⦾')
call deoplete#custom#set('file', 'mark', '')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '✄')
call deoplete#custom#set('alchemist', 'mark', '')
call deoplete#custom#set('alchemist', 'rank', 1)
call deoplete#custom#set('tag', 'mark', '')

" deoplete-ternjs
let g:tern_request_timeout = 1
let g:tern#filetypes = ['js', 'jsx', 'javascript.jsx', 'vue']

" vim-jsx
let g:jsx_ext_required = 0

" rspec-vim
let g:rspec_command = 'Dispatch rspec {spec}'

"elm-vim
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_format_fail_silently = 1
let g:elm_browser_command = 'open'
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" goyo.vim
function! s:goyo_enter()
  silent !tmux set status off
  set cursorline
  set scrolloff=999
  Limelight
  Pencil
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set nocursorline
  set scrolloff=5
  Limelight!
  NoPencil
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd! FileType markdown,mkd call pencil#init()

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

" ALE
let g:ale_lint_delay = 5000

let g:ale_sign_error = '**'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['scss'] = ['stylelint', 'sasslint']
let g:ale_linters['startify'] = []

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fix_on_save = 1

" vim-gutentags
let g:gutentags_cache_dir = '~/.tags_cache'

" fzf.vim
set rtp+=/usr/local/opt/fzf

" vim-startify
let g:startify_custom_header =
      \ map(split(system('cat ~/.config/nvim/banner'), '\n'), '"   ". v:val')

" vim-airline
let g:airline_theme='tender'
let g:airline_powerline_fonts = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#neomake#error_symbol='• '
let g:airline#extensions#neomake#warning_symbol='•  '

" tmuxline
let g:tmuxline_powerline_separators = 0

" tagbar
let g:tagbar_type_elixir = {
  \ 'ctagstype' : 'elixir',
  \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
  \ ]
\ }

" NERDTree ----------------------------------
"" Open NERDTree automatically when Vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"" Close Vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" -------------------------------------------

highlight VertSplit guifg=#4b5263
highlight EndOfBuffer guifg=#282C34

augroup filetypedetect
  au BufRead,BufNewFile *.vue setfiletype html
augroup END

cabbrev %s OverCommandLine<cr>%s
cabbrev s OverCommandLine<cr>s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s
