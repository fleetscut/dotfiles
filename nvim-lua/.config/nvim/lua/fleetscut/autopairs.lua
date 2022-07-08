local autopairs_status, autopairs = pcall(require,"nvim-autopairs")
if not autopairs_status then
    return
end

local cmp_status, cmp = pcall(require,"cmp")
if not cmp_status then
    return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

autopairs.setup{
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
