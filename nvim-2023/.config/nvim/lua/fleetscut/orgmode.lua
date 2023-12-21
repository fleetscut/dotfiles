local M = {}

M.todo_keywords = { "TODO(t)", "DEV(d)", "UAT(u)", "|", "PROD(p)", "DONE(z)" }

M.capture_templates = {
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
}

return M
