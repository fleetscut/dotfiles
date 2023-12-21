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
			win_split_mode = "float",
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
