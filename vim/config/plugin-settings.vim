scriptencoding utf-8

" ==============================================================================
" Plugin Settings
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" lightline.vim
" ------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

let g:lightline.active = {
      \	  'left': [
      \	    ['mode', 'paste'],
      \	    ['gitbranch', 'readonly', 'filename'],
      \	  ],
      \	  'right': [
      \	    ['lineinfo', 'coc_status'],
      \	    ['filetype', 'fileencoding', 'fileformat'],
      \	    ['fileinfo'],
      \     ['context'],
      \	  ]
      \ }

let g:lightline.component_function = {
      \   'coc_status': 'coc#status',
      \   'context': 'CocCurrentFunction',
      \   'fileencoding': 'LightlineFileEncoding',
      \   'fileformat': 'LightlineFileFormat',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \   'gitbranch': 'LightlineGitBranch',
      \   'lineinfo': 'LightlineLineInfo',
      \   'mode': 'LightlineMode',
      \	  'readonly': 'LightLineReadOnly'
      \ }

function! LightlineFileEncoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFilename()
  if &filetype !~? 'nerdtree'
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
  endif
  return ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineGitBranch()
  try
    if &filetype !~? 'nerdtree' && exists('*fugitive#head')
      let mark = ' '
      let branch = fugitive#head()
      return branch !=# '' ? mark . branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineLineInfo()
  return &filetype ==# 'nerdtree' ? '' :
        \ printf('%d:%-2d', line('.'), col('.'))
endfunction

function! LightlineMode()
  return &filetype ==# 'nerdtree' ? 'NERDTree' :
        \ lightline#mode()
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|nerdtree' && &readonly ? 'RO' : ''
endfunction

" Startify
" ------------------------------------------------------------------------------
if has("nvim")
  let g:startify_custom_header =
      \ map(split(system('cat ~/.config/vim/misc/nvim-banner.txt'), '\n'), '"   ". v:val')
else
  let g:startify_custom_header =
      \ map(split(system('cat ~/.config/vim/misc/vim-banner.txt'), '\n'), '"   ". v:val')
end

" VimDevicons
" ------------------------------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ex$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.exs$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.lock$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.log$'] = ''

" The NERDTree
" ------------------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" fzf
" ------------------------------------------------------------------------------
" Match the color scheme
let g:fzf_colors = {
      \   'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment']
      \ }

" tmuxline.vim
" ------------------------------------------------------------------------------
let g:tmuxline_powerline_separators = 0

" Coc
" ------------------------------------------------------------------------------
let g:coc_status_error_sign = ' '
let g:coc_status_warning_sign = ' '

" gruvbox
" ------------------------------------------------------------------------------
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italicize_strings = 1
let g:gruvbox_italic = 1
