-- ==========================================================
-- Commands
-- ==========================================================

local cmd = vim.cmd

-- Package management
cmd [[command! PackerInstall lua require('ngs.packages').install()]]
cmd [[command! PackerCompile lua require('ngs.packages').compile()]]
cmd [[command! PackerUpdate  lua require('ngs.packages').update()]]
cmd [[command! PackerClean   lua require('ngs.packages').clean()]]
cmd [[command! PackerSync    lua require('ngs.packages').sync()]]
cmd [[command! PackerGet     lua require('ngs.util').get_packer()]]
