""
"" Janus setup
""

" Define paths
" let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
" let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_path = '$HOME/.vim/janus'
let g:janus_vim_path = '$HOME/.vim/janus/vim'
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" Associcate CSP files with HTML filetype
au BufNewFile,BufRead *.csp set filetype=html

" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

""""""""""""""
" Custom stuff
""""""""""""""

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set rtp+=$POWERLINE_HOME/bindings/vim

" Josh's Magic Vim Config Edit Key of Wonder
nmap <silent> <F12> :if bufloaded($HOME . '/.vimrc') && bufnr(@%) == bufnr($HOME.'/.vimrc') <CR>w<CR>execute 'source ' . $HOME . '/.vimrc'<CR>bd<CR>else<CR>execute 'tabe ' . $HOME . '/.vimrc'<CR>endif<CR><CR>

" Run Ruby file
" Need to make this detect the language to run whatever
nmap <silent> <F10> :w<CR> :!ruby %<CR>

" Switch off highlighting
nmap <silent> <F9> :nohl<CR>

" Pretty highlighting
hi Search cterm=NONE ctermfg=black ctermbg=yellow

""""""""""""""

" .vimrc.after is loaded after the plugins have loaded
