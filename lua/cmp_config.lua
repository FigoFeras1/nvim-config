local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")


cmp.setup({
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm(),
    ['<C-e>'] = cmp.mapping.close(),
  },
  snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
      format = lspkind.cmp_format({ with_text = true, maxwidth = 100 }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'omni'},
    { name = 'luasnip' },
  },
  experimental = {
    -- native_menu = false,
    ghost_text = true
  }
})
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline', keyword_length = 2},
    { name = 'path' },
  }
})
-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  }
})
cmp.setup.cmdline('?', {
  sources = {
    { name = 'buffer' },
  }
})
