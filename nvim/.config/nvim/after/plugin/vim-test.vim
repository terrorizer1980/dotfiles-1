if !exists('g:loaded_test') | finish | endif

let test#strategy = 'floaterm'

nmap <silent> <Leader>tn <Cmd>TestNearest<CR>
nmap <silent> <Leader>tf <Cmd>TestFile<CR>
nmap <silent> <Leader>ts <Cmd>TestSuite<CR>
nmap <silent> <Leader>tt <Cmd>TestLast<CR>
nmap <silent> <Leader>tv <Cmd>TestVisit<CR>
