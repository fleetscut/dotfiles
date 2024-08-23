local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnep_status, luasnip = pcall(require, "luasnip")
if not luasnep_status then
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	return
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()

lspkind.init()

--vim.o.completeopt = "menu,menuone"
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-t>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-s>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.confirm({ behaviour = cmp.ConfirmBehavior.Replace, select = true })
		-- 	-- elseif require("copilot.suggestion").is_visible() then
		-- 	-- 	require("copilot.suggestion").accept()
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	-- elseif has_words_before() then
		-- 	-- 	cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				-- Kind icons
				--vim_item.kind = kind_icons[vim_item.kind]

				if entry.source.name == "cmp_tabnine" then
					vim_item.kind = icons.misc.Robot
					vim_item.kind_hl_group = "CmpItemKindTabnine"
				end
				-- NOTE: order matters
				vim_item.menu = ({
					buffer = "[buf]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[api]",
					path = "[path]",
					luasnip = "[snip]",
					emoji = "",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "vim-dadbod-completion" },
		{ name = "orgmode" },
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	preselect = cmp.PreselectMode.None,
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
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
