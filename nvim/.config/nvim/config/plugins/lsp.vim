lua require("lsp")

function s:lsp_keys() abort
  nnoremap <silent><buffer> gd    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
  nnoremap <silent><buffer> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent><buffer> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent><buffer> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent><buffer> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent><buffer> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent><buffer> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent><buffer> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent><buffer> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent><buffer> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <silent><buffer> gn    <cmd>lua require'jumpLoc'.jumpNextLocationCycle()<CR>
  nnoremap <silent><buffer> gp    <cmd>lua require'jumpLoc'.jumpPrevLocationCycle()<CR>
endfunction

let g:diagnostic_trimmed_virtual_text = '20'

augroup lsp
  autocmd!
  autocmd Filetype elixir,typescript,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype elixir,typescript,typescriptreact call s:lsp_keys()
  autocmd CursorHold *.ex,*.exs,*.ts,*.tsx lua vim.lsp.util.show_line_diagnostics()
augroup END

sign define LspDiagnosticsErrorSign       text=⮾  texthl=LspDiagnosticsError linehl= numhl=
sign define LspDiagnosticsWarningSign     text=  texthl=LspDiagnosticsWarning linehl= numhl=
sign define LspDiagnosticsInformationSign text=𝒊 texthl=LspDiagnosticsInformation linehl= numhl=
sign define LspDiagnosticsHintSign        text=⯑  texthl=LspDiagnosticsHint linehl= numhl=
