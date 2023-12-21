return {
	"nvim-orgmode/orgmode",
	-- event = "VeryLazy",
	enabled = true,
	config = function()
		require("orgmode").setup({
			org_agenda_files = "~/.orgfiles/**/*",
			org_default_notes_file = "~/.orgfiles/refile.org",
			org_todo_keywords = { "TODO(t)", "PENDING", "|", "DONE" },
			-- win_split_mode = "float",
			org_capture_templates = {
				n = {
					description = "Note",
					template = "* %? :NOTE:\n\t%U\n\t",
				},
				a = "Nested",
				aa = {
					description = "Nest 1",
					template = "* %? Nest 1",
				},
				ab = {
					description = "Nest 2",
					template = "* %? Nest 2",
				},
				-- s = "SECM",
				-- sj = require("fleetscut.work.orgmode").capture_jira,
				-- st = require("fleetscut.work.orgmode").capture_workitem,
			},
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
