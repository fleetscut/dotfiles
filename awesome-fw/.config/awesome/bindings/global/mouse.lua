local awful = require("awful")

local menus = require("widgets.menus")
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function()
		menus.mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev),
})
