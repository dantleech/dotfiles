Plug 'phpactor/phpactor' ,  {'branch': 'develop','do': 'composer install', 'for': 'php'}
" phpactor
let g:phpactorBranch = "master"
let g:phpactorOmniError = v:true
let g:phpactorUseOpenWindows = v:true
" let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
" let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'
" let g:phpactorPhpBin = "/home/daniel/.local/bin/php@7.3"

"autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType cucumber setlocal omnifunc=phpactor#Complete
"autocmd FileType php setlocal omnifunc=phpactor#Complete
"autocmd Filetype php setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd FileType php setlocal omnifunc=lsp#complete
nmap <Leader>u :PhpactorImportClass<CR>
nmap <Leader>e :PhpactorClassExpand<CR>
nmap <Leader>ua :PhpactorImportMissingClasses<CR>
nmap <Leader>mm :PhpactorContextMenu<CR>
nmap <Leader>nn :PhpactorNavigate<CR>
"nmap"ut <buffer> <Leader>o
"    \ :PhpactorGotoDefinition<CR>
"au FileType php,cucumber nmap <buffer> <Leader>O
"    \ :PhpactorGotoType<CR>
"au FileType php nmap <buffer> <Leader>K :PhpactorHover<CR>
nmap <Leader>tt :PhpactorTransform<CR>
nmap <Leader>cc :PhpactorClassNew<CR>
nmap <Leader>ci :PhpactorClassInflect<CR>
nmap <Leader>fr :PhpactorFindReferences<CR>
nmap <Leader>mf :PhpactorMoveFile<CR>
nmap <Leader>cf :PhpactorCopyFile<CR>
nmap <silent> <Leader>ee
            \ :PhpactorExtractExpression<CR>
vmap <silent> <Leader>ee
            \ :<C-u>PhpactorExtractExpression<CR>
vmap <silent> <Leader>em
            \ :<C-u>PhpactorExtractMethod<CR>

