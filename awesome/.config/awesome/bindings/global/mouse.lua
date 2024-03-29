local awful = require("awful")
local gears = require("gears")

local menus = require("widgets.menus")
return gears.table.join(
	awful.button({}, 3, function()
		menus.mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
)
