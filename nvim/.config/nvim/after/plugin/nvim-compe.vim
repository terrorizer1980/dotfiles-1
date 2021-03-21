if !exists('g:loaded_compe') | finish | endif

lua require('config.nvim-compe')

inoremap <silent><expr> <CR>      compe#confirm('<CR>')

imap <expr> <C-l>   vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   luaeval('require"config.nvim-compe".tab(1)')
imap <expr> <Tab>   luaeval('require"config.nvim-compe".tab(1)')
imap <expr> <S-Tab> luaeval('require"config.nvim-compe".tab(-1)')
imap <expr> <S-Tab> luaeval('require"config.nvim-compe".tab(-1)')