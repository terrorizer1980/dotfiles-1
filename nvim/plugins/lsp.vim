lua require("lsp")

nnoremap <silent> gd    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gn    <cmd>lua require'jumpLoc'.jumpNextLocationCycle()<CR>
nnoremap <silent> gp    <cmd>lua require'jumpLoc'.jumpPrevLocationCycle()<CR>

let g:diagnostic_trimmed_virtual_text = '20'

augroup lsp
  autocmd Filetype elixir,typescript,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd CursorHold *.ex,*.exs,*.ts,*.tsx lua vim.lsp.util.show_line_diagnostics()
  " autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

" highlight LspDiagnosticsError guifg=#DD0000
sign define LspDiagnosticsErrorSign       text=⮾  texthl=LspDiagnosticsError linehl= numhl=
sign define LspDiagnosticsWarningSign     text=  texthl=LspDiagnosticsWarning linehl= numhl=
sign define LspDiagnosticsInformationSign text=𝒊 texthl=LspDiagnosticsInformation linehl= numhl=
sign define LspDiagnosticsHintSign        text=⯑  texthl=LspDiagnosticsHint linehl= numhl=
