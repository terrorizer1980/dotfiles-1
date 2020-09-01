fzf_path = '/usr/local/opt/fzf'

options = {
  backup         = false,
  completeopt    = 'menuone,preview,noinsert,noselect',
  cursorline     = true,
  expandtab      = true,
  fillchars      = 'vert:│',
  foldenable     = true,
  foldlevelstart = 5,
  foldmethod     = 'marker',
  foldnestmax    = 10,
  grepprg        = 'rg --vimgrep',
  hidden         = true,
  ignorecase     = true,
  inccommand     = 'split',
  number         = true,
  relativenumber = true,
  rtp            = vim.o.rtp .. ',' .. fzf_path,
  scrolloff      = 5,
  shiftwidth     = 2,
  shortmess      = vim.o.shortmess .. 'c',
  showmode       = false,
  signcolumn     = 'yes:2',
  smartcase      = true,
  smartindent    = true,
  softtabstop    = 2,
  splitbelow     = true,
  splitright     = true,
  swapfile       = false,
  tabstop        = 2,
  termguicolors  = true,
  undofile       = true,
  updatetime     = 300,
}

for key, val in pairs(options) do
  vim.api.nvim_set_option(key, val)
end
