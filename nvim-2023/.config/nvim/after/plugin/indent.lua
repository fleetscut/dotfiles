local indentline_status, indentline = pcall(require, "indent_blankline")
if not indentline_status then
    return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

indentline.setup{
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}
