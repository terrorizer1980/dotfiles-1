"
" 							   __
"   __          __/\ \__               __
"  /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
"  \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"   \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"    \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"     \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/
"
"
"
" Author: N. G. Scheurich
" Repo: https://github.com/ngscheurich/dotfiles




"" ======================================================
"" Plugins
"" ------------------------------------------------------

set runtimepath+=/Users/nscheurich/.config/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/nscheurich/.config/dein')
call dein#begin('/Users/nscheurich/.config/dein')
call dein#add('/Users/nscheurich/.config/dein/repos/github.com/Shougo/dein.vim')


call dein#add('tpope/vim-sensible')               " Some sensible defaults to start with


" UI niceities
" -------------------------------------------------------


call dein#add('jacoborus/tender.vim')             " My colorscheme of choice
call dein#add('mhinz/vim-startify')               " Fancy start screen
call dein#add('vim-airline/vim-airline')          " Fancy status bar
call dein#add('edkolev/tmuxline.vim')             " vim-airline-like status bar for tmux
call dein#add('scrooloose/nerdtree')              " Project tree drawer
call dein#add('ryanoasis/vim-devicons')           " Icons in status bar, NERDTree, etc.
call dein#add('majutsushi/tagbar')                " Tag navigation bar
call dein#add('sjl/gundo.vim')                    " Undo tree visualizer
call dein#add('szw/vim-maximizer')                " Maximize/restore current window


" Language and framework support
" -------------------------------------------------------

call dein#add('elixir-lang/vim-elixir')           " Elixir syntax highlihting and indentation
call dein#add('slashmili/alchemist.vim')          " Elixir integration via alchemist-server
call dein#add('carlitux/deoplete-ternjs',
             { 'build': 'npm install -g tern' })  " Autocompletion for JavaScript
call dein#add('ElmCast/elm-vim')                  " Elm integration
call dein#add('c-brenn/phoenix.vim')              " Phoenix integration
call dein#add('tpope/vim-projectionist')          " Project file navigation; required for phoenix.vim
call dein#add('tpope/vim-rails')                  " Ruby on Rails integration
call dein#add('mxw/vim-jsx')                      " JSX syntax support
call dein#add('thoughtbot/vim-rspec')             " RSpec integration
call dein#add('cespare/vim-toml')                 " TOML syntax highlighting
call dein#add('HerringtonDarkholme/yats.vim')     " TypeScript autocompletion
call dein#add('posva/vim-vue')                    " Syntax highlighting for Vue.js single file components
call dein#add('joukevandermaas/vim-ember-hbs')    " Ember Handlebars/HTMLBars
call dein#add('othree/html5.vim')                 " HTML5 omnicomplete and syntax
call dein#add('mattn/emmet-vim')                  " Expand abbreviations à la Emment
call dein#add('pangloss/vim-javascript')          " Improved JavaScript indentation and syntax highlighting


" Markdown and prose
" -------------------------------------------------------

call dein#add('junegunn/goyo.vim')                " Distraction-free writing
call dein#add('junegunn/limelight.vim')           " Dim text that is not focused
call dein#add('reedes/vim-pencil')                " Tons of prose-related features


" Utilities
" -------------------------------------------------------

call dein#add('Shougo/neosnippet')                " Support for snippets
call dein#add('Shougo/neosnippet-snippets')       " Some basic snippets
call dein#add('mklabs/split-term.vim')            " Utilites around neovim's :terminal
call dein#add('tpope/vim-fugitive')               " Git integration
call dein#add('jreybert/vimagit')                 " Like Magit for Emacs
call dein#add('airblade/vim-gitgutter')           " Display file changes in the gutter
call dein#add('Shougo/denite.nvim')               " Think 'Helm for Vim'
call dein#add('Shougo/deoplete.nvim',
             { 'build': ':UpdateRemotePlugins' }) " Asynchronous completion engine
call dein#add('christoomey/vim-tmux-navigator')   " Navigate seamlessly between vim and tmux splits
call dein#add('bogado/file-line')                 " Open files to a given line with file:lineno
call dein#add('csexton/trailertrash.vim')         " Deal with EOL whitespace
call dein#add('tomtom/tcomment_vim')              " Toggle comments
call dein#add('junegunn/fzf.vim')                 " Integrate with fzf
call dein#add('tpope/vim-bundler')                " Integrate with bundler
call dein#add('tpope/vim-dispatch')               " Perform async tasks in a tmux split
call dein#add('tpope/vim-endwise')                " End coding structures automatically, i.e. `do`...`end`
call dein#add('maxbrunsfeld/vim-yankstack')       " Kill ring implementation
call dein#add('dietsche/vim-lastplace')           " Open files where you left them
call dein#add('editorconfig/editorconfig-vim')    " EditorConfig support
call dein#add('ludovicchabant/vim-gutentags')     " Manage tag files
call dein#add('tpope/vim-vinegar')                " Navigate up a directory in netrw
call dein#add('Rykka/colorv.vim')                 " Make working with colors easier
call dein#add('w0rp/ale')                         " Asynchronous Lint Engine
call dein#add('godlygeek/tabular')                " Easily align text


call dein#end()
call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif




"" ======================================================
"" General settings
"" ------------------------------------------------------

set encoding=utf-8                                " Set character encoding
filetype plugin on                                " Enable the native filetype plugin
set wildignore+=*/tmp/*,*.so,*.swp,*.zip          " Set wildcard ignores
syntax enable                                     " Enable syntax highlighting
set number                                        " Show line numbers
set relativenumber                                " Show relative line numbers
set cursorline                                    " Highlight current line
set splitbelow                                    " Open horizontal splits below current window
set splitright                                    " Open vertical splits to the right of the current window
set noswapfile                                    " Don't use swapfiles
set nowritebackup                                 " Don't create a backup before writing a file
set nobackup                                      " Don't keep backups around
set autoindent                                    " Copy indent from current line when starting a new line
set smartindent                                   " Do smart autoindenting when starting a new line.
set smarttab                                      " Insert correct number of blanks on <Tab>; delete them on <BS>
set shiftwidth=2                                  " Number of spaces to use for each step of (auto)indent
set softtabstop=2                                 " Number of spaces that a <Tab> counts for while performing editing operations
set tabstop=2                                     " Number of spaces that a <Tab> in the file counts for
set expandtab                                     " Insert proper amount of spaces in Insert mode
colorscheme tender                                " Set colorscheme
let g:netrw_banner = 0                            " No netrw banner
set ignorecase                                    " Ignore case when searching
set smartcase                                     " Ignore case when searching lowercase

" Set gutter background color
hi SignColumn ctermbg=235

" Customize split borders
set fillchars+=vert:\ 

" GUI options
set guifont=Fira\ Code:h13	                      " Set font
set guioptions-=l          	                      " Don't show left scrollbar
set guioptions-=L          	                      " Don't show left scrollbar
set guioptions-=r          	                      " Don't show right scrollbar
set guioptions-=R          	                      " Don't show right scrollbar
set guioptions-=e          	                      " Don't use the macOS native tabline

if (has("termguicolors"))
  set termguicolors                               " Use 24-bit color if the terminal supports it
endif




"" ======================================================
"" Filetype-based settings
"" ------------------------------------------------------

augroup elm
	autocmd!
	autocmd BufNewFile,BufRead *.elm setlocal tabstop=4
	autocmd BufNewFile,BufRead *.elm setlocal shiftwidth=4
	autocmd BufNewFile,BufRead *.elm setlocal softtabstop=4
augroup END




"" ======================================================
"" Keybindings
"" ------------------------------------------------------

" Map leader to comma
let mapleader = ","

" Stop highlighting search results on <ESC>
map <ESC> :noh<CR>

" Navigate splits
tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
tnoremap <buffer> <C-l> <C-\><C-n><C-w>l

" Next/previous tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close window
nnoremap <F4> :close<CR>

" Quickly press jk to leave Insert mode
inoremap jk <ESC>

" fzf.vim
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>/ :Ag<CR>

" Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" NERDTree
map <Leader>\ :NERDTreeToggle<CR>

" tagbar
nmap <Leader>t :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Enter cmdline mode with semicolon
nnoremap ; :

" vim-yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Use <Tab> for autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"




"" ======================================================
"" Plugin configuration
"" ------------------------------------------------------

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

" deoplete-tern-js
let g:tern_request_timeout = 1
let g:tern#filetypes = [ 'jsx', 'javascript.jsx', 'vue' ]

" vim-javascript
let g:javascript_plugin_flow = 1

" goyo.vim
function! s:goyo_enter()
  silent !tmux set status off
  set cursorline
  set scrolloff=999
  Pencil
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set nocursorline
  set scrolloff=5
  NoPencil
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd! FileType markdown,mkd call pencil#init()

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

" ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_delay = 5000
let g:ale_sign_column_always = 1
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'startify': []
  \ }

" vim-gutentags
let g:gutentags_cache_dir = '~/.tags_cache'

" fzf.vim
set rtp+=/usr/local/opt/fzf

" git-gutter
let g:gitgutter_sign_column_always = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around']
let g:echodoc_enable_at_startup=1

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction

function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

function! Preview_func()
  if &pvw
    setlocal nonumber norelativenumber
   endif
endfunction

call deoplete#custom#set('buffer', 'mark', 'ℬ')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⌾')
call deoplete#custom#set('file', 'mark', 'file')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '')
call deoplete#custom#set('typescript',  'rank', 630)

autocmd CompleteDone * pclose
autocmd WinEnter * call Preview_func()

" " Elm support
" " See: https://github.com/ElmCast/elm-vim/issues/52#issuecomment-264161975
" let g:deoplete#sources.elm = ['omni'] + g:deoplete#sources._
" let g:deoplete#omni#functions.elm = ['elm#Complete']
" let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
" let g:deoplete#disable_auto_complete = 1

" vim-startify
let g:startify_custom_header =
      \ map(split(system('cat ~/.config/nvim/banner'), '\n'), '"   ". v:val')

" vim-airline
let g:airline_theme='tender'
let g:airline_powerline_fonts = 0

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

" NERDTree
"" Open NERDTree automatically when Vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"" Close Vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
