local M = {}
local awful = require("awful")
local beautiful = require("beautiful")

local mymainmenu = require("widgets.menus").mymainmenu
M.testlauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

return M
