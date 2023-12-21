return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = false,
		config = function(lazy, opts)
			require("rose-pine").setup(opts)

			vim.cmd("colorscheme rose-pine")
		end,
		opts = {
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = "auto",
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = "moon",
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = false,
			disable_float_background = false,
			disable_italics = false,

			--- @usage string hex value or named color from rosepinetheme.com/palette
			groups = {
				background = "base",
				background_nc = "_experimental_nc",
				panel = "surface",
				panel_nc = "base",
				border = "highlight_med",
				comment = "muted",
				link = "iris",
				punctuation = "subtle",

				error = "love",
				hint = "iris",
				info = "foam",
				warn = "gold",

				headings = {
					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
				-- or set all headings at once
				-- headings = 'subtle'
			},

			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			-- ":Inspect" - Look for treesitter group or Extmarks
			highlight_groups = {
				ColorColumn = { bg = "rose" },

				-- Blend colours against the "base" background
				CursorLine = { bg = "foam", blend = 10 },
				StatusLine = { fg = "love", bg = "love", blend = 10 },
				Visual = { fg = "nc", bg = "rose" },
				Cursor = { fg = "base", bg = "pine" },

				-- By default each group adds to the existing config.
				-- If you only want to set what is written in this config exactly,
				-- you can set the inherit option:
				Search = { bg = "gold", inherit = false },

				-- treesitter groups
				["@text.literal.xml"] = { fg = "white" },
			},
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function(lazy, opts)
			require("solarized-osaka").setup(opts)

			vim.cmd("colorscheme solarized-osaka-night")
		end,
		opts = {
			-- 	-- your configuration comes here
			-- 	-- or leave it empty to use the default settings
			transparent = true, -- Enable this to disable setting the background color
			-- 	-- terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
			-- 	-- styles = {
			-- 	-- 	-- Style to be applied to different syntax groups
			-- 	-- 	-- Value is any valid attr-list value for `:help nvim_set_hl`
			-- 	-- 	comments = { italic = true },
			-- 	-- 	keywords = { italic = true },
			-- 	-- 	functions = {},
			-- 	-- 	variables = {},
			-- 	-- 	-- Background styles. Can be "dark", "transparent" or "normal"
			-- 	-- 	sidebars = "dark", -- style for sidebars, see below
			-- 	-- 	floats = "dark", -- style for floating windows
			-- 	-- },
			-- 	-- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			-- 	-- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			-- 	-- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			-- 	-- dim_inactive = false, -- dims inactive windows
			-- 	-- lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			--
			-- 	--- You can override specific color groups to use other groups or a hex color
			-- 	--- function will be called with a ColorScheme table
			-- 	---@param colors ColorScheme
			-- 	-- on_colors = function(colors) end,
			--
			-- 	--- You can override specific highlights to use other groups or a hex color
			-- 	--- function will be called with a Highlights and ColorScheme table
			-- 	---@param highlights Highlights
			-- 	---@param colors ColorScheme
			-- 	-- on_highlights = function(highlights, colors) end,
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			-- light_style = "day", -- The theme is used when the background is set to light
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			---@param colors ColorScheme
			on_colors = function(colors) end,

			--- You can override specific highlights to use other groups or a hex color
			--- function will be called with a Highlights and ColorScheme table
			---@param highlights Highlights
			---@param colors ColorScheme
			on_highlights = function(highlights, colors) end,
		},
		config = function(lazy, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
}
