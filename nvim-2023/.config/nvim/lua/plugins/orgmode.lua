local profile = os.getenv("PROFILE")

local todo_keywords
local capture_template = require("fleetscut.orgmode").capture_templates
if profile == "work" then
	local work = require("fleetscut.work.orgmode")
	todo_keywords = work.todo_keywords
	capture_template = vim.tbl_deep_extend("force", work.capture_templates, capture_template)
else
	todo_keywords = require("fleetscut.orgmode").todo_keywords
end
return {
	"nvim-orgmode/orgmode",
	-- event = "VeryLazy",
	enabled = true,
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/.orgfiles/**/*",
			org_default_notes_file = "~/.orgfiles/refile.org",
			-- win_split_mode = "float",
			-- win_split_mode = function(name)
			-- 	local bufnr = vim.api.nvim_create_buf(false, false)
			-- 	vim.api.nvim_buf_set_name(bufnr, name)
			-- 	vim.api.nvim_buf_set_option(bufnr, "filetype", "org")
			--
			-- 	local fill = 0.8
			-- 	local width = math.floor((vim.o.columns * fill))
			-- 	local height = math.floor((vim.o.lines * fill))
			-- 	local row = math.floor((((vim.o.lines - height) / 2) - 1))
			-- 	local col = math.floor(((vim.o.columns - width) / 2))
			--
			-- 	-- vim.api.nvim_set_current_buf(bufnr)
			-- 	vim.api.nvim_open_win(bufnr, true, {
			-- 		relative = "editor",
			-- 		width = width,
			-- 		height = height,
			-- 		row = row,
			-- 		col = col,
			-- 		style = "minimal",
			-- 		border = "rounded",
			-- 	})
			-- end,
			org_todo_keywords = todo_keywords,
			org_capture_templates = capture_template,
			mappings = {
				capture = {
					org_capture_finalize = "<Leader>w",
				},
				org = {
					org_toggle_checkbox = "<leader><Space>",
				},
			},
		})
	end,
}
