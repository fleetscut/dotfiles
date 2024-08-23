local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
	return
end

local context_status, ts_context = pcall(require, "treesitter-context")
if not context_status then
	return
end

local checkOS = require("fleetscut.osver").checkOS
--require("orgmode").setup_ts_grammar()

treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"awk",
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"csv",
		"diff",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"glsl",
		"gpg",
		"graphql",
		"html",
		"http",
		"ini",
		"java",
		"javascript",
		"jq",
		"jsdoc",
		"json",
		"json5",
		"latex",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"ninja",
		"org",
		"passwd",
		"python",
		"regex",
		"rust",
		"sql",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"query",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = { "properties" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = { "org" },
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	content_commentstring = {
		enable = true,
		enable_autocmd = true,
	},
	autoag = {
		enable = true,
		disable = { "" },
	},
	-- rainbow = {
	-- 	enable = true,
	-- 	query = "rainbow-parens",
	-- 	strategy = require("ts-rainbow").strategy.global,
	-- 	disable = { "" },
	-- },
	playground = {
		enable = true,
	},
})

ts_context.setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			"for", -- These won't appear in the context
			"while",
			"if",
			"switch",
			"case",
		},
		-- Example for a specific filetype.
		-- If a pattern is missing, *open a PR* so everyone can benefit.
		--   rust = {
		--       'impl_item',
		--   },
	},
	exact_patterns = {
		-- Example for a specific filetype with Lua patterns
		-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
		-- exactly match "impl_item" only)
		-- rust = true,
	},

	-- [!] The options below are exposed but shouldn't require your attention,
	--     you can safely ignore them.

	zindex = 20, -- The Z-index of the context window
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
})
