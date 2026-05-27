local blink = require('blink.cmp')

blink.build():wait(10000)

blink.setup({
    keymap = {
        preset = "default",
    },
    completion = {
        trigger = {
            show_in_snippet = true,
            show_on_keyword = true,
            show_on_trigger_character = true,
        },
        menu = {
            auto_show = true,
        }
    }
})
