-- ==========================================================
-- Commands
-- ==========================================================

-- Package management
vim.cmd [[command! PackerInstall lua require("ngs.packages").install()]]
vim.cmd [[command! PackerCompile lua require("ngs.packages").compile()]]
vim.cmd [[command! PackerUpdate  lua require("ngs.packages").update()]]
vim.cmd [[command! PackerClean   lua require("ngs.packages").clean()]]
vim.cmd [[command! PackerSync    lua require("ngs.packages").sync()]]
vim.cmd [[command! PackerGet     lua require("ngs.util").get_packer()]]

vim.cmd [[command! Xa <Cmd>xa<CR>]]
