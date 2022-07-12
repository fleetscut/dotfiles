local M = {}

local store_status, schemastore = pcall(require, "schemastore")
if not store_status then
	return
end

M.config = {
	init_options = {
		privideFormatter = false,
	},
	ettings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}

return M
