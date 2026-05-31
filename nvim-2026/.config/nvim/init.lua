require('vim._core.ui2').enable({
    enable = true,
    msg = {
        -- targets = {
        --     list_cmd = "pager",
        --     lua_print = "msg",
        --     emsg = "pager"
        -- },
        msg = "cmd", pager = { height = 0.5 },
        dialog = { height = 0.5} ,
        cmd = { height = 0.5},
        msg = { height = 0.5 }
    }
})
vim.g.mapleader = " "

require('fleetscut.config')
require('fleetscut.plugins')
