" =========================================================
" Neovim configuration
" =========================================================
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Disable some built-in plugins
let g:loaded_netrwPlugin      = 0
let g:loaded_python_provider  = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider    = 0
let g:loaded_node_provider    = 0
let g:loaded_perl_provider    = 0

source ~/.config/nvim/options.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim

colorscheme base16-default-dark

let g:ackprg = 'rg --vimgrep'

nnoremap <Leader>e <Cmd>FloatermNew ranger<CR>

nmap <Leader>r <Plug>(Luadev-RunLine)
vmap <Leader>r <Plug>(Luadev-Run)

let g:startify_session_persistence = 1
let g:startify_bookmarks = {}

nnoremap <Leader>wh <Cmd>Startify<CR>

let g:tmuxline_powerline_separators = 0

let g:ale_disable_lsp = 1
lua <<EOF
-- Only execute specified linters
vim.g.ale_linters_explicit = true

-- Run fixers on save
vim.g.ale_fix_on_save = true

vim.g.ale_linters = {
  css             = {"stylelint"},
  javascript      = {"eslint"},
  typescript      = {"eslint"},
  html            = {"tidy"}
}

vim.g.ale_fixers = {
  css             = {"prettier", "stylelint"},
  javascript      = {"prettier"},
  typescript      = {"prettier"},
  json            = {"prettier"},
  html            = {"prettier"}
}
EOF

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

lua require('lightline')

lua require('lsp')

function! s:lsp_stop() abort
  lua vim.lsp.stop_client(lsp.get_active_clients())
endfunction

function! s:lsp_restart() abort
  call s:lsp_stop()
  execute 'edit'
endfunction

function! s:lsp_info() abort
  lua print(vim.inspect(vim.lsp.buf_get_clients()))
endfunction

nnoremap <Leader>ff <Cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>fg <Cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <Leader>fb <Cmd>lua require('telescope.builtin').buffers({show_all_buffers = true})<CR>
nnoremap <Leader>fh <Cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <Leader>fr <Cmd>lua require('telescope.builtin').registers()<CR>
nnoremap <Leader>ft <Cmd>lua require('telescope.builtin').builtin()<CR>
