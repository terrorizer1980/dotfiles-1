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


call dein#add('tpope/vim-sensible')                      " Some sensible defaults to start with


" UI niceities
" -------------------------------------------------------

call dein#add('edkolev/tmuxline.vim')                    " vim-airline-like status bar for tmux
call dein#add('jacoborus/tender.vim')                    " My colorscheme of choice
call dein#add('majutsushi/tagbar')                       " Tag navigation bar
call dein#add('mhinz/vim-startify')                      " Fancy start screen
call dein#add('osyo-manga/vim-over')                     " Preview :substitute commands
call dein#add('rakr/vim-one')                            " Another nice colorscheme
call dein#add('ryanoasis/vim-devicons')                  " Icons in status bar, NERDTree, etc.
call dein#add('scrooloose/nerdtree')                     " Project tree drawer
call dein#add('sjl/gundo.vim')                           " Undo tree visualizer
call dein#add('szw/vim-maximizer')                       " Maximize/restore current window
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight') " Colored devicons
call dein#add('vim-airline/vim-airline')                 " Fancy status bar


" Language and framework support
" -------------------------------------------------------

call dein#add('carlitux/deoplete-ternjs',
      \ { 'build': 'npm install -g tern' })             " Autocompletion for JavaScript
call dein#add('ElmCast/elm-vim')                        " Elm integration
call dein#add('HerringtonDarkholme/yats.vim')           " TypeScript autocompletion
call dein#add('alols/vim-love-efm')                     " LÖVE support
call dein#add('c-brenn/phoenix.vim')                    " Phoenix integration
call dein#add('cespare/vim-toml')                       " TOML syntax highlighting
call dein#add('elixir-lang/vim-elixir')                 " Elixir syntax highlihting and indentation
call dein#add('joukevandermaas/vim-ember-hbs')          " Ember Handlebars/HTMLBars
call dein#add('justinj/vim-pico8-syntax')               " PICO-8 syntax support
call dein#add('mattn/emmet-vim')                        " Expand abbreviations à la Emment
call dein#add('mxw/vim-jsx')                            " JSX syntax support
call dein#add('othree/html5.vim')                       " HTML5 omnicomplete and syntax
call dein#add('pangloss/vim-javascript')                " Improved JavaScript indentation and syntax highlighting
call dein#add('posva/vim-vue')                          " Syntax highlighting for Vue.js single file components
call dein#add('slashmili/alchemist.vim')                " Elixir integration via ElixirSense
call dein#add('thoughtbot/vim-rspec')                   " RSpec integration
call dein#add('tmux-plugins/vim-tmux')                  " Niceties for editing Tmux config files
call dein#add('tpope/vim-projectionist')                " Project file navigation; required for phoenix.vim
call dein#add('tpope/vim-rails')                        " Ruby on Rails integration


" Markdown and prose
" -------------------------------------------------------

call dein#add('junegunn/goyo.vim')                      " Distraction-free writing
call dein#add('junegunn/limelight.vim')                 " Dim text that is not focused
call dein#add('reedes/vim-pencil')                      " Tons of prose-related features
call dein#add('robertbasic/vim-hugo-helper')            " Helpers for writing posts for Hugo


" Utilities
" -------------------------------------------------------

call dein#add('Rykka/colorv.vim')                       " Make working with colors easier
call dein#add('Shougo/deoplete.nvim',
      \ { 'build': ':UpdateRemotePlugins' })            " Asynchronous completion engine
call dein#add('Shougo/neosnippet')                      " Support for snippets
call dein#add('Shougo/neosnippet-snippets')             " Some basic snippets
call dein#add('abaldwin88/roamer.vim')                  " Manage files with roamer
call dein#add('airblade/vim-gitgutter')                 " Display file changes in the sign column
call dein#add('bogado/file-line')                       " Open files to a given line with file:lineno
call dein#add('christoomey/vim-tmux-navigator')         " Navigate seamlessly between vim and tmux splits
call dein#add('csexton/trailertrash.vim')               " Deal with EOL whitespace
call dein#add('dietsche/vim-lastplace')                 " Open files where you left them
call dein#add('editorconfig/editorconfig-vim')          " EditorConfig support
call dein#add('godlygeek/tabular')                      " Easily align text
call dein#add('junegunn/fzf.vim')                       " Integrate with fzf
call dein#add('justinmk/vim-sneak')                     " Jump to any location specified by two characters
call dein#add('ludovicchabant/vim-gutentags')           " Manage tag files
call dein#add('mklabs/split-term.vim')                  " Utilites around neovim’s :terminal
call dein#add('powerman/vim-plugin-AnsiEsc')            " Deal with ANSI escape sequences
call dein#add('roxma/vim-tmux-clipboard')               " Better Vim/Tmux clipboard interop
call dein#add('svermeulen/vim-easyclip')                " Simplified clipboard functionality
call dein#add('tmux-plugins/vim-tmux-focus-events')     " Tmux compatibility fixes
call dein#add('tpope/vim-abolish')                      " Operate on variants of a word (plural, case, etc.)
call dein#add('tpope/vim-bundler')                      " Integrate with Bundler
call dein#add('tpope/vim-commentary')                   " Toggle comments
call dein#add('tpope/vim-dispatch')                     " Perform async tasks in a tmux split
call dein#add('tpope/vim-endwise')                      " End coding structures automatically, i.e. `do`...`end`
call dein#add('tpope/vim-fugitive')                     " Git integration
call dein#add('tpope/vim-projectionist')                " Project configuration
call dein#add('tpope/vim-repeat')                       " Remap . in a way that plugins can tap into it
call dein#add('tpope/vim-sleuth')                       " Heuristically set buffer indentation options
call dein#add('tpope/vim-speeddating')                  " Use CTRL-A/CTRL-X to increment dates, times, and more
call dein#add('tpope/vim-vinegar')                      " Navigate up a directory in netrw
call dein#add('tpope/vim-unimpaired')                   " Complementary key mappings based around [ and ]
call dein#add('w0rp/ale')                               " Asynchronous Lint Engine

call dein#end()
call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif



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

" Open current file’s directory in Finder
map <Leader>d :!open %/..<CR>

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

let g:ale_sign_error = '>>'
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

" https://github.com/joshdick/onedark.vim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
"     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

highlight VertSplit guifg=#4b5263
highlight EndOfBuffer guifg=#282C34

augroup filetypedetect
  au BufRead,BufNewFile *.vue setfiletype html
augroup END

cabbrev %s OverCommandLine<cr>%s
cabbrev s OverCommandLine<cr>s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s
