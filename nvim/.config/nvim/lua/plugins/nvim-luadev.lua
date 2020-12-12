local utils = require('utils')

-- Send lines/selections to nvim-luadev REPL
utils.nmap('<Leader>r', '<Plug>(Luadev-RunLine)')
utils.vmap('<Leader>r', '<Plug>(Luadev-Run)')
