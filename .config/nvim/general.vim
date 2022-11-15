filetype off                   " required!
let $NVIM_COC_LOG_LEVEL = 'debug'

set clipboard+=unnamedplus

set rtp+=~/.fzf
set rtp+=~/www/phpactor/phpactor
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" =============================== "
" =========== Config ============ "

" Automatically detect filetypes
filetype plugin indent on

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" Automatically write file for some commands, like cfile
set autowrite

" show lines numbers
set relativenumber
set number

" enable real-time searching
set incsearch

" highlight search matches
set hlsearch

" used by f.e. gitgutter
set updatetime=100

set conceallevel=0
" Vim notes
let g:notes_smart_quotes = 0
let g:notes_unicode_enabled = 0

" nerdtree
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeCascadeSingleChildDir=0
let NERDTreeWinSize=40

let g:node_client_debug = 1

" set syntax highlighting options.
syntax on
let c_space_errors = 1
let php_sql_query = 1
let php_sync_method = 0
let php_folding=0
let g:DisableAutoPHPFolding = 1
let g:PHP_noArrowMatching = 1

let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout' : 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
  \}
let g:vrc_allow_get_request_body = 1

" Disable all folding
set nofoldenable

" Nerdtree: Close NERDTree if it is the last open buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" show TWIG highlighting
au BufRead,BufNewFile *.twig set syntax=twig

scriptencoding utf-8
set history=1000
set nospell
set pastetoggle=<F12>

" status lines -- note this is not used when airline is enabled
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\ " Filename
    set statusline+=%w%h%m%r " Options
    " set statusline+=%{fugitive#statusline()} " Git Hotness
    "set statusline+=\ [%{&ff}/%Y] " filetype
    "set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Ignore files
set wildignore+=*/.git/*,*.cache,*.cache.php,*.swp,*.swo,**/cache/**,*.min.js

" Allow hidden buffers
set hidden

" CtrlP
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 80
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = ''
let g:ctrlp_map = ''

" autocmd FileType rst setlocal textwidth=78
autocmd Filetype markdown setlocal textwidth=78 wrapmargin=100
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"<B

autocmd CompleteDone * pclose
set completeopt=noinsert,menuone,noselect,preview

" =============================== "
" ===== Keyboard Mappings ======= "
let g:move_key_modifier = 'C'
let mapleader=","

" Toggle NERDTree file browser
map <Leader>n :NERDTreeToggle <CR>

" Open current file in NERDTree
map <Leader>f :NERDTreeFind <CR>


" Git
noremap <silent><Leader>gs :Git<CR>

" noremap <C-b> <cmd>lua require('telescope.builtin').buffers()<cr>
" noremap <C-t> <cmd>lua require('telescope.builtin').help_tags()<cr>
" noremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
" noremap <C-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
" Fuzzy search open buffers
map <C-B> :CtrlPBuffer <CR>
" Fuzzy search tags
map <C-T> :CtrlPTag <CR>
" Fuzzy search all project filenames
map <C-P> :FZF <CR>

" Reload the .vimrc config
map <Leader>vr :so ~/.vimrc<CR>

" Edit .vimrc
map <Leader>ve :tabnew ~/.vimrc<CR>

" Next quick fix item
map <Leader>= :cnext<CR>
map <Leader>+ :cnf<CR>

" Previous quick fix item
map <Leader>- :cprev<CR>
map <Leader>) :cpf<CR>
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tg :TestVisit<CR>


" Remap C-w C-w to C-w C-o, like in tmux
nnoremap <C-w><C-o> <C-w><C-w>
nnoremap <C-w>o <C-w><C-w>
nnoremap <silent> <leader>aw :ArgWrap<CR>
nnoremap <silent> <leader>sl :SidewaysLeft<CR>
nnoremap <silent> <leader>sr :SidewaysRight<CR>

command! CopyFilePath let @+ = expand('%p')
command! CopyFullPath let @+ = expand('%:p')

func! AsciiMode()
    syntax off
    setlocal virtualedit=all
    setlocal cc=80
    autocmd BufWritePre * :%s/\s\+$//e
endfu
com! ASC call AsciiMode()

"let g:completor_php_omni_trigger = '(->\w{2,}|::\w*)'
"let g:completor_disable_filename = 1
"let g:completor_disable_buffer = 1
"let g:completor_disable_ultisnips = 1

" Nice colors for autocomplete
" highlight Pmenu ctermbg=black ctermfg=white  gui=bold

"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! Align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

lua << EOF
-- require'lspconfig'.phpactor.setup{}
EOF


let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = 'lsp-client.log'
let g:LanguageClient_windowLogMessageLevel = 'INFO'
let g:LanguageClient_completionPreferTextEdit = 1

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" ale
let g:ale_linters = {'php': ['php', 'phpcs'], 'vim': ['vint']}
let g:ale_php_phpstan_executable = './vendor/bin/phpstan'
let g:ale_php_phpmd_executable = './vendor/bin/phpmd'
let g:ale_completion_enabled = 0
let g:ale_fixers = ['phpcbf', 'php_cs_fixer']
"let g:ale_fix_on_save = 1

