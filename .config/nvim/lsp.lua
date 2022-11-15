require"fidget".setup{}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.lsp.set_log_level('trace');
vim.api.nvim_set_keymap('n', ',di', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', ',dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ',dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', ',dd', '<cmd>lua vim.diagnostic.disable()<CR>', opts)
vim.api.nvim_set_keymap('n', ',de', '<cmd>lua vim.diagnostic.enable()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>CR',  ':LspRestart<CR>', opts)


local on_attach = function(client, bufnr)

    vim.cmd [[ highlight LspReferenceText guifg=LightMagenta guibg=Black ]]
    vim.cmd [[ highlight link LspReferenceRead LspReferenceText ]]
    vim.cmd [[ highlight link LspReferenceWrite LspReferenceText ]]
    vim.cmd [[ autocmd! CursorHold <buffer> silent! lua vim.lsp.buf.document_highlight() ]]
    vim.cmd [[ autocmd! CursorHoldI <buffer> silent! lua vim.lsp.buf.document_highlight() ]]
    vim.cmd [[ autocmd! CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references() ]]


    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',o', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',I', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',O', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', ',ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',R', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',df', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require("mason").setup {}
require("mason-lspconfig").setup{}
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lspconfig.gopls.setup{
    on_attach = on_attach,
    settings = {
        gopls = {
            usePlaceholders = false,
            buildFlags =  {"-tags=integration"},
            gofumpt = true,
            ["local"] = "<repo>",
        }
    },
    init_options = {
        buildFlags =  {"-tags=integration"},
    }
}
lspconfig.tsserver.setup{
    on_attach = on_attach,
    settings = {
    },
    init_options = {
    }
}

lspconfig.phpactor.setup{
    capabilities = capabilities,
    cmd = { 'env', 'XDEBUG_SESSION=1', 'phpactor', 'language-server' },
    filetypes = { 'php', 'cucumber' },
    on_attach = on_attach,
    init_options = {
    }
}

lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
    }
}
