local exists, saga = pcall(require, 'lspsaga')

if exists then
  local util = require('ngs.util')
  local hi = util.highlight

  local sign_bg = util.get_highlight_attr('SignColumn', 'bg')
  local pal = vim.g.ngs_palette

  saga.init_lsp_saga({
    use_saga_diagnostic_sign = false,
    code_action_prompt = {
      virtual_text = false
    },
  })

  -- TODO LspSaga colors
  -- hi('DefinitionCount', {})
  -- hi('DefinitionIcon', {})
  -- hi('DefinitionPreviewTitle', {})
  -- hi('DiagnosticError', {})
  -- hi('DiagnosticHint', {})
  -- hi('DiagnosticInformation', {})
  -- hi('DiagnosticTruncateLine', {})
  -- hi('DiagnosticWarning', {})
  -- hi('LspDiagnosticsFloatingError', {})
  -- hi('LspDiagnosticsFloatingHint', {})
  -- hi('LspDiagnosticsFloatingInfor', {})
  -- hi('LspDiagnosticsFloatingWarn', {})
  -- hi('LspFloatWinBorder', {})
  -- hi('LspSagaAutoPreview', {})
  -- hi('LspSagaBorderTitle', {})
  -- hi('LspSagaCodeActionBorder', {})
  -- hi('LspSagaCodeActionContent', {})
  -- hi('LspSagaCodeActionTitle', {})
  -- hi('LspSagaCodeActionTruncateLine', {})
  -- hi('LspSagaDefPreviewBorder', {})
  hi('LspSagaDiagnosticBorder', {fg = pal.magenta })
  hi('LspSagaDiagnosticHeader', {fg = pal.yellow })
  -- hi('LspSagaDiagnosticTruncateLine', {})
  -- hi('LspSagaDocTruncateLine', {})
  -- hi('LspSagaFinderSelection', {})
  -- hi('LspSagaFinderSelection', {})
  -- hi('LspSagaHoverBorder', {})
  -- hi('LspSagaLightBulb', {})
  hi('LspSagaLightBulbSign', {fg = pal.cyan, bg = sign_bg})
  -- hi('LspSagaLspFinderBorder', {})
  -- hi('LspSagaRenameBorder', {})
  -- hi('LspSagaRenamePromptPrefix', {})
  -- hi('LspSagaShTruncateLine', {})
  -- hi('LspSagaSignatureHelpBorder', {})
  -- hi('ProviderTruncateLine', {})
  -- hi('ReferencesCount', {})
  -- hi('ReferencesIcon', {})
  -- hi('SagaShadow', {})
  -- hi('TargetFileName', {})
  -- hi('TargetWord', {})
end
