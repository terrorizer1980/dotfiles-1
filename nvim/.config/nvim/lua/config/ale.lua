local g = vim.g

g.ale_disable_lsp      = 1
g.ale_linters_explicit = 1
g.ale_fix_on_save      = 1

g.ale_linters = {
  css             = {"stylelint"},
  javascript      = {"eslint"},
  html            = {"tidy"},
  typescript      = {"eslint"},
  typescriptreact = {"eslint"},
}

g.ale_fixers = {
  css             = {"prettier", "stylelint"},
  javascript      = {"prettier"},
  typescript      = {"prettier"},
  json            = {"prettier"},
  typescriptreact = {"prettier"},
  html            = {"prettier"},
}
