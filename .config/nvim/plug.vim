call plug#begin('~/.vim/plugged')
" =============================== "
" ======== Vundle Config ======== "
"Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'joshdick/onedark.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'neovim/nvim-lsp'
Plug 'cespare/vim-toml'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'pedrohdz/vim-yaml-folds'

" Neovim LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'williamboman/nvim-lsp-installer', {'branch': 'master'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'ray-x/lsp_signature.nvim'
Plug 'j-hui/fidget.nvim'

" CoC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'shaunsingh/solarized.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'yashguptaz/calvera-dark.nvim'

" Themes
Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/edge'

"Plug 'davidhalter/jedi-vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/fzf.vim'
"Plug 'elzr/vim-json'
Plug 'diepm/vim-rest-console'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-projectionist'
Plug 'xolox/vim-misc'
Plug 'janko/vim-test'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'chrisbra/unicode.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'plasticboy/vim-markdown'

" Plugin for developing plugins
Plug 'tpope/vim-scriptease'
Plug 'sotte/presenting.vim'

Plug 'mhinz/vim-grepper'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/BufOnly.vim'
"Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

"Plug 'roxma/nvim-completion-manager'

"Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"Plug 'phpactor/ncm2-phpactor'
"Plug 'StanAngeloff/php.vim'

Plug 'sjl/gundo.vim'
Plug 'mechatroner/rainbow_csv'

Plug 'junegunn/vader.vim'

" Preview images in ASCII
" Plug 'ashisha/image.vim'

" Aligning
Plug 'godlygeek/tabular'

" Color scheme
 Plug 'vim-scripts/twilight256.vim'

" Grep buffers
Plug 'vim-scripts/Buffer-grep'

" Ctrlp - quickly find files, tags and buffers using fuzzy search
Plug 'kien/ctrlp.vim'

" Twig syntax highlighting
Plug 'lumiliet/vim-twig'

" Plug 'w0rp/ale'

" File browser
Plug 'scrooloose/nerdtree'
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Get GITHub activity
" Plug 'junegunn/vim-github-dashboard'

" PHP Documentation - hit K (shift-k) on any php function
Plug 'mudpile45/vim-phpdoc'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Plug 'henrik/vim-qargs'

" Vdebug - PHP debugging
" Plug 'joonty/vdebug'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Gist
" Plug 'mattn/webapi-vim'
 Plug 'mattn/gist-vim'

" Argument wrapping and unwrapping
Plug 'FooSoft/vim-argwrap'
Plug 'AndrewRadev/sideways.vim'

Plug 'matze/vim-move'

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'ncm2/ncm2-go'
"Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'


call plug#end()
