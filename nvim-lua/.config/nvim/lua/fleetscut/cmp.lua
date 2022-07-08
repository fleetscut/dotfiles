local cmp_status_ok, cmp = pcall( require, "cmp")
if not cmp_status_ok then
    return
end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
        documentation = {
            border = "rounded",
            winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
        completion = {
            border = "rounded",
            winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ['<C-c>'] = cmp.mapping{
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
      },
     -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
      ["<Tab>"] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_next_item()
                      --elseif luasnip.jumpable(1) then
                      --    luasnip.jump(1)
                      --elseif luasnip.expand_or_jumpable() then
                      --    luasnip.expand_or_jump()
                      --elseif luasnip.expandable() then
                      --    luasnip.expand()
                      --elseif check_backspace() then
                      --    -- cmp.complete()
                      --    fallback()
                      else
                          fallback()
                      end
                  end, { "i", "s", }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_prev_item()
                      --elseif luasnip.jumpable(-1) then
                      --    luasnip.jump(-1)
                      else
                          fallback()
                      end
                    end, { "i", "s", }),
    }),
    --formatting = {},
    sources = {
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'nvim_lua', group_index = 2},
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip', group_index = 2}, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer', group_index = 2},
        { name = 'path', group_index = 2},
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = "rounded",
            winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
        completion = {
            border = "rounded",
            winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
    },
    experimental = {
        ghost_text = true,
    },
    --sorting = {},
    
  -- Set configuration for specific filetype.
  --cmp.setup.filetype('gitcommit', {
  --  sources = cmp.config.sources({
  --    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  --  }, {
  --    { name = 'buffer' },
  --  })
  --})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline('/', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--      { name = 'buffer' }
--    }
--  })
--
--  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })
    })
