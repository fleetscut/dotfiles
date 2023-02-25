local M = {}
-- This is used later as the default terminal and editor to run.
M.terminal = "kitty"
M.editor = os.getenv("EDITOR") or "editor"
M.editor_cmd = M.terminal .. " -e " .. M.editor

return M
