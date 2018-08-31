" Keybindings
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" General {{{
let mapleader = ","
nmap <Leader>d :!open %/..<CR>
nmap <Leader>h :tabprevious <CR>
nmap <Leader>l :tabnext <CR>
map <Leader>e :Errors<CR>
map <Leader>m :silent make<CR>
map <ESC> :noh<CR>
inoremap jk <ESC>
nnoremap <space> za
nnoremap ; :
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}} ----------------------------------------------------------------
" fzf.vim {{{
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>/ :Ag<CR>
" }}} ----------------------------------------------------------------
" vim-fugitive {{{
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>
map <Leader>gl :Glog<CR>
map <Leader>gd :Gdiff<CR>
" }}} ----------------------------------------------------------------
" NERDTree {{{
map <Leader>\ :NERDTreeToggle<CR>
" }}} ----------------------------------------------------------------
" Tagbar {{{
nmap <Leader>t :TagbarToggle<CR>
nmap tt :TagbarOpen fj<CR>
" }}} ----------------------------------------------------------------
" Vim-Maximizer {{{
map <Leader>w :MaximizerToggle<CR>
" }}} ----------------------------------------------------------------
" Neosnippet {{{
imap <C-\> <Plug>(neosnippet_expand_or_jump)
smap <C-\> <Plug>(neosnippet_expand_or_jump)
xmap <C-\> <Plug>(neosnippet_expand_target)
" }}} ----------------------------------------------------------------
" OmniSharp {{{
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
nnoremap <Leader>nm :OmniSharpRename<CR>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
nnoremap <Leader>tp :OmniSharpAddToProject<CR>
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
" }}} ----------------------------------------------------------------
" ALE {{{
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" }}} ----------------------------------------------------------------
" test.vim {{{
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" }}} ----------------------------------------------------------------

" vim:foldmethod=marker:foldlevel=0
