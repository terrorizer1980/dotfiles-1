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
