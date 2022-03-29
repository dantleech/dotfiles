set rtp+=~/www/phpactor/coc-phpactor
set rtp+=~/www/neoclide/coc.nvim

function! CocFunc()
    let currentFunctionSymbol = get(b:, 'coc_current_function', '')
    return currentFunctionSymbol !=# '' ? "\uf6a6 " .currentFunctionSymbol : ''
endfunction

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'component_function': {
        \ 'cocstatus': 'coc#status',
        \ 'currentFunc': 'CocFunc'
        \},
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste', ],
        \           [ 'readonly', 'relativepath', 'modified' ],
        \           [ 'cocstatus', 'currentFunc' ] ],
       \}
\}

nmap <silent><Leader>r <Plug>(coc-range-select)
xmap <silent><Leader>r <Plug>(coc-range-select)
nmap <Leader>o <Plug>(coc-definition)
nmap <Leader>O <Plug>(coc-type-definition)
nmap <Leader>I <Plug>(coc-implementation)
nmap <Leader>R <Plug>(coc-references)
nmap <Leader>ca <Plug>(coc-codeaction)
xmap <Leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap K :call <SID>show_documentation()<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
autocmd CursorHold * silent call CocActionAsync('highlight')
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    inoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


nmap <Leader>CR :CocRestart<CR>
" Better CoC highlighting
"autocmd ColorScheme * highlight CocHighlightText     ctermfg=LightMagenta    guifg=LightMagenta

