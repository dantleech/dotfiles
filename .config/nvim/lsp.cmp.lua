local cmp = require 'cmp'
local compare = require('cmp.config.compare')

cmp.setup {
    formatting = {
        format = function(entry, vim_item)
            -- ensure detail is shown (e.g. the class FQN)
            -- vim_item.menu = entry.completion_item.detail
            return vim_item
        end
    },
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        compare.sort_text,
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.length,
        compare.order,
      },
    },
    sources = {
        { name = 'nvim_lsp' },
        -- { name = 'buffer' },
        { name = 'luasnip'},
        { name = 'nvim_lsp_signature_help' },
    }
}
