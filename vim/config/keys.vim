" Keybindings
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

let mapleader = ","

noremap <ESC> :noh<CR>
noremap <Leader>/ :Ag<CR>
noremap <Leader>\ :NERDTreeToggle<CR>
noremap <Leader>b :Denite buffer<CR>
noremap <Leader>e :Errors<CR>
noremap <Leader>f :Denite file/rec<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gl :Glog<CR>
noremap <Leader>gl :Glog<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>m :silent make<CR>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap jk <ESC>

nnoremap <Leader>an :ALENextWrap<cr>
nnoremap <Leader>ap :ALEPreviousWrap<cr>
nnoremap <Leader>d :!open %/..<CR>
nnoremap <Leader>h :tabprevious <CR>
nnoremap <Leader>l :tabnext <CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap tt :TagbarOpen fj<CR>

