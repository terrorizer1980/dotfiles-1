scriptencoding utf-8

" ==============================================================================
" Key Mappings
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Vim
" ------------------------------------------------------------------------------
let mapleader = ","

imap jk <ESC>

nmap <ESC> :noh<CR>

nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" The NERDTree
" ------------------------------------------------------------------------------
nmap <Leader>\ :NERDTreeToggle<CR>
nmap <Leader>m :silent make<CR>

" test.vim
" ------------------------------------------------------------------------------
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> t<C-t> :TestLast<CR>
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-s> :TestSuite<CR>

" denite.nvim
" ------------------------------------------------------------------------------
nnoremap <Leader>f :<C-u>Denite file/rec -start-filter<CR>
nnoremap <Leader>/ :<C-u>Denite grep:.<CR>

" Coc
" ------------------------------------------------------------------------------
" Trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> "h<C-g>u\<CR>"

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show all diagnostics
nnoremap <silent> <Space>a :<C-u>CocList diagnostics<CR>

" Manage extensions
nnoremap <silent> <Space>e :<C-u>CocList extensions<CR>

" Show commands
nnoremap <silent> <Space>c :<C-u>CocList commands<CR>

" Find symbol of current document
nnoremap <silent> <Space>o :<C-u>CocList outline<CR>

" Search workspace symbols
nnoremap <silent> <Space>s :<C-u>CocList -I symbols<CR>

" Do default action for next item.
nnoremap <silent> <Space>j :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> <Space>k :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <silent> <Space>p :<C-u>CocListResume<CR>

" Improve the completion experience
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-the-completion-experience

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Note: you have to remap <cr> to make sure it confirm completion when pum is visible.
" Note: \<C-g>u is used to break undo level.
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" To make coc.nvim format your code on <cr>, use keymap:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" fzf
" ------------------------------------------------------------------------------
nmap <silent> <Leader>f :Files<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> <Leader>/ :Rg<CR>

" Toggle Background
" ------------------------------------------------------------------------------
call togglebg#map("<F5>")

" Miscellaneous
" ------------------------------------------------------------------------------
nmap <silent> <Leader>p :w <Bar> !pandoc % -s -o output.icml <Bar> echo "Exported as ICML"<CR>
