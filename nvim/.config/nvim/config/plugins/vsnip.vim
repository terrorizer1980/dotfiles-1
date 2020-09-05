let vsnip_snippet_dir    = '~/.config/nvim/snippets'
let g:vsnip_integ_config = {'nvim_lsp': 1}

imap <expr> <C-y> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'
