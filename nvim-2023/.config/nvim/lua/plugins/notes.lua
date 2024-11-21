local profile = os.getenv("PROFILE")

return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = false,
		enabled = true,
		-- ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		-- 	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- 	-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- 	-- refer to `:h file-pattern` for more examples
		-- 	"BufReadPre "
		-- 		.. vim.fn.expand("~")
		-- 		.. "/Documents/notes/obsidian/Test/*.md",
		-- 	"BufNewFile " .. vim.fn.expand("~") .. "/Documents/notes/obsidian/Test/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ui = { enable = false },
			workspaces = {
				{
					name = "Test",
					path = function()
						if profile == "work" then
							return require("fleetscut.work.notes").notes_dir
						else
							return "/home/fleetscut/Documents/obsidian/Notes/"
						end
					end,
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},

			picker = {
				name = "telescope.nvim",
			},
			-- Optional, customize how note IDs are generated given an optional title.
			--- @param title string|?
			--- @return string
			note_id_func = function(title)
				local name = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					name = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						name = name .. string.char(math.random(65, 90))
					end
				end
				return name
			end,
			-- -- Optional, customize how note file names are generated given the ID, target directory, and title.
			-- --- @param spec { id: string, dir: obsidian.Path, title: string|? }
			-- --- @return string|obsidian.Path The full path to the new note.
			-- note_path_func = function(spec)
			-- 	local path
			-- 	if spec.title ~= nil then
			-- 		local title = tostring(spec.title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower())
			-- 		path = spec.dir / title
			-- 	else
			-- 		-- This is equivalent to the default behavior.
			-- 		path = spec.dir / tostring(spec.id)
			-- 	end
			-- 	return path:with_suffix(".md")
			-- end,
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
