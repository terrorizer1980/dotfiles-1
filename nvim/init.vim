" vim: nowrap
scriptencoding utf-8

" Neovim configuration
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo:   https://github.com/ngscheurich/dotfiles

  " ------------------------------------------------------------------------------
  " Packages
  " ------------------------------------------------------------------------------
  if exists('*minpac#init')
    call minpac#init()

    " Package manager
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " Code intelligence
    call minpac#add('dense-analysis/ale')
    call minpac#add('natebosch/vim-lsc')

    " UI enhancements
    call minpac#add('airblade/vim-gitgutter')
    call minpac#add('hoov/tmuxline.vim', {'branch': 'truecolor-lightline'})
    call minpac#add('itchyny/lightline.vim')
    call minpac#add('ryanoasis/vim-devicons')

    " Language/framework support
    call minpac#add('calviken/vim-gdscript3')
    call minpac#add('dart-lang/dart-vim-plugin')
    call minpac#add('heavenshell/vim-jsdoc')
    call minpac#add('jdonaldson/vaxe')
    call minpac#add('sheerun/vim-polyglot')
    call minpac#add('thosakwe/vim-flutter')

    " Colorschemes
    call minpac#add('arzg/vim-colors-xcode')
    call minpac#add('chriskempson/base16-vim')
    call minpac#add('lifepillar/vim-solarized8')
    call minpac#add('nightsense/cosmic_latte')

    " Snippets support
    call minpac#add('hrsh7th/vim-vsnip')
    call minpac#add('hrsh7th/vim-vsnip-integ')

    " General enhancements
    call minpac#add('andymass/vim-matchup')
    call minpac#add('editorconfig/editorconfig-vim')
    call minpac#add('fsharpasharp/vim-dirvinist')
    call minpac#add('janko/vim-test')
    call minpac#add('junegunn/fzf.vim')
    call minpac#add('justinmk/vim-dirvish')
    call minpac#add('justinmk/vim-sneak')
    call minpac#add('mbbill/undotree')
    call minpac#add('mileszs/ack.vim')
    call minpac#add('preservim/nerdtree')
    call minpac#add('romainl/vim-qf')
    call minpac#add('sunaku/vim-dasht')
    call minpac#add('tpope/vim-abolish')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('tpope/vim-dispatch')
    call minpac#add('tpope/vim-endwise')
    call minpac#add('tpope/vim-eunuch')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tpope/vim-obsession')
    call minpac#add('tpope/vim-projectionist')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-rsi')
    call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
    call minpac#add('tpope/vim-speeddating')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-unimpaired')
    call minpac#add('tpope/vim-vinegar')
  endif

  " ------------------------------------------------------------------------------
  "  General Configuration
  " ------------------------------------------------------------------------------
  set completeopt=menuone,preview
  set cursorline
  set expandtab
  set fillchars+=vert:│
  set foldenable
  set foldlevelstart=5
  set foldmethod=marker
  set foldnestmax=10
  set grepprg=rg\ --vimgrep
  set hidden
  set ignorecase
  set inccommand=split
  set nobackup
  set noshowmode
  set noswapfile
  set number
  set relativenumber
  set rtp+=/usr/local/opt/fzf
  set scrolloff=5
  set shiftwidth=2
  set shortmess+=c
  set signcolumn=yes
  set smartcase
  set smartindent
  set softtabstop=2
  set splitbelow
  set splitright
  set tabstop=2
  set termguicolors
  set undofile

  set background=dark
  colorscheme cosmic_latte

  " ------------------------------------------------------------------------------
  " Mappings & Commands
  " ------------------------------------------------------------------------------
  let mapleader=" "

  nnoremap <Right> <C-w>l
  nnoremap <Left>  <C-w>h
  nnoremap <Up>    <C-w>k
  nnoremap <Down>  <C-w>j

  nnoremap <silent> <Esc> :nohlsearch<CR>

  nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/
  nnoremap <Leader>rl :s/\<<C-r><C-w>\>/

  noremap Y y$

  noremap n nzz
  noremap N Nzz

  command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
  command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
  command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

  nnoremap <Leader>cc :cclose<CR>
  nnoremap <Leader>lc :lclose<CR>

  nnoremap <C-n> <Plug><qf_qf_next>
  nnoremap <C-p> <Plug><qf_qf_previous>
  nnoremap <C-n> <Plug><qf_loc_next>
  nnoremap <C-p> <Plug><qf_loc_previous>

  " ------------------------------------------------------------------------------
  "  Plugin Configuration
  " ------------------------------------------------------------------------------
  let s:error_sign = '⊘'
  let s:warning_sign = ' '
  let s:info_sign = ' '
  let s:hint_sign = ' '

  " ALE
  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save = 1

  let g:ale_linters = {
        \ 'css': ['stylelint'],
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint', 'tslint'],
        \ 'typescriptreact': ['eslint', 'tslint'],
        \ 'html': ['tidy'],
        \ }

  let g:ale_fixers = {
        \ '*': ['trim_whitespace'],
        \ 'css': ['prettier'],
        \ 'javascript': ['prettier'],
        \ 'typescript': ['prettier'],
        \ 'typescriptreact': ['prettier'],
        \ 'json': ['prettier'],
        \ 'html': ['prettier'],
        \ }

  " vim-lsc
  let g:lsc_server_commands = {
        \ 'elixir': '/Users/nick/Projects/elixir-ls/release/language_server.sh',
        \ 'javascript': 'typescript-language-server --stdio',
        \ 'typescript': 'typescript-language-server --stdio',
        \ 'typescriptreact': 'typescript-language-server --stdio',
        \ 'rust': 'rls',
        \ }

  let g:lsc_auto_map = {
        \ 'GoToDefinition': '<C-]>',
        \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
        \ 'FindReferences': 'gr',
        \ 'NextReference': '<C-n>',
        \ 'PreviousReference': '<C-p>',
        \ 'FindImplementations': 'gI',
        \ 'FindCodeActions': 'ga',
        \ 'Rename': 'gR',
        \ 'ShowHover': v:true,
        \ 'DocumentSymbol': 'go',
        \ 'WorkspaceSymbol': 'gS',
        \ 'SignatureHelp': 'gm',
        \ 'Completion': 'completefunc',
        \ }

  autocmd CompleteDone * silent! pclose

  " vsnip
  let g:vsnip_snippet_dir = '~/.config/nvim/snippets'
  let g:vsnip_integ_config = {'vim_lsc': 1}
  imap <expr> <C-y> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'

  " echodoc
  let g:echodoc#enable_at_startup = 1
  let g:echodoc#type = 'floating'

  " fzf.vim
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  let g:fzf_colors = {
        \ 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'],
        \ }
  nnoremap <silent> <Leader>f :Files<CR>
  nnoremap <silent> <Leader>b :Buffers<CR>
  nnoremap <silent> <Leader>/ :Rg<CR>

  " lightline.vim
  let g:lightline = {
        \ 'colorscheme': 'cosmic_latte_dark',
        \ 'active': {
        \   'left': [[ 'mode', 'paste' ], [ 'git', 'readonly'], ['filename', 'modified' ]],
        \   'right': [
        \     ['lineinfo'],
        \     ['percent'],
        \     ['method', 'obsession', 'filetype', 'fileinfo'],
        \   ]
        \ },
        \ 'inactive': {
        \   'left': [[ 'git', 'readonly'], ['filename', 'modified' ]],
        \   'right': [['obsession', 'filetype', 'fileinfo']]
        \ },
        \ 'component': {
        \   'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
        \   'fileformat': '%{&ff}',
        \   'fileinfo': '%{&ff}[%{&fenc!=#""?&fenc:&enc}]',
        \   'filename': '%t',
        \   'filetype': '%{&ft!=#""?&ft:"no ft"}',
        \   'lineinfo': '%3l:%-2v ',
        \   'mode': '%{lightline#mode()}',
        \   'modified': '[%M]',
        \   'obsession': '%{ObsessionStatus()}',
        \   'paste': '%{&paste?"PASTE":""}',
        \   'percent': '%3p%% ☰ ',
        \   'readonly': '%R',
        \ },
        \ 'component_function': {
        \   'git': 'GitCurrentBranch',
        \ },
        \ 'component_expand': {
        \ },
        \ 'subseparator': {
        \   'left': '',
        \   'right': '',
        \ },
        \ }

  function! GitCurrentBranch()
    let l:branch = fugitive#Head()
    return winwidth(0) < 120 || l:branch == '' ? '' : ' ' . fugitive#Head()
  endfunction

  let g:lsp_signs_error = {'text': s:error_sign}
  let g:lsp_signs_warning = {'text': s:warning_sign}
  let g:lsp_signs_hint = {'text': s:hint_sign}

  " tmuxline.vim
  let g:tmuxline_powerline_separators = 0

  " test.vim
  " let test#strategy = 'dispatch'

  nnoremap <silent> t<C-n> :TestNearest<CR>
  nnoremap <silent> t<C-f> :TestFile<CR>
  nnoremap <silent> t<C-a> :TestSuite<CR>
  nnoremap <silent> t<C-t> :TestLast<CR>
  nnoremap <silent> t<C-g> :TestVisit<CR>

  " vimwiki
  let g:notes = {
        \ 'path': '~/Dropbox/wikis/notes/',
        \ 'auto_toc': 1,
        \ 'nested_syntaxes': {
        \   'c': 'c',
        \   'elixir': 'elixir',
        \   'javascript': 'javascript',
        \   'typescript': 'typescript',
        \   'viml': 'viml',
        \ },
        \ }

  let g:safe_harbour = {
        \ 'path': '~/Dropbox/wikis/safe_harbour/',
        \ 'auto_toc': 1,
        \ }

  let g:new_aperio = {
        \ 'path': '~/Dropbox/wikis/new_aperio/',
        \ 'auto_toc': 1,
        \ 'nested_syntaxes': {
        \   'elixir': 'elixir',
        \   'javascript': 'javascript',
        \   'typescript': 'typescript',
        \ },
        \ }

  let g:vimwiki_list = [g:notes, g:safe_harbour, g:new_aperio]
  let g:vimwiki_hl_headers= 1
  let g:vimwiki_global_ext = 0
  let g:vimwiki_listsyms = ' ○◐●✓'
  let g:vimwiki_folding = 'expr'

  " NERDTree
  nnoremap <leader>tt :NERDTreeToggle<CR>
  nnoremap <leader>tf :NERDTreeFind<CR>

  " gruvbox
  let g:gruvbox_italic = 1
  let g:gruvbox_contrast_dark = 'hard'

  " GitGutter
  let g:gitgutter_sign_added = '┃'
  let g:gitgutter_sign_modified = '┃'
  let g:gitgutter_sign_removed = '•'
  let g:gitgutter_sign_removed_first_line = '•'
  let g:gitgutter_sign_modified_removed = '•'
  let g:gitgutter_sign_allow_clobber = 1
  let g:lsp_signs_priority = 15

  " ack.vim
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  endif
