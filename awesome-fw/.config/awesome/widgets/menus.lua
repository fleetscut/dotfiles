local M = {}

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local menubar = require("menubar")
local wibox = require("wibox")

local apps = require("config.apps")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- Create a launcher widget and a main menu
M.myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", apps.terminal .. " -e man awesome" },
	{ "edit config", apps.editor_cmd .. " " .. _G.awesome.conffile },
	{ "restart", _G.awesome.restart },
	{
		"quit",
		function()
			_G.awesome.quit()
		end,
	},
}

local menu_awesome = { "awesome", M.myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", apps.terminal }

if has_fdo then
	M.mymainmenu = freedesktop.menu.build({
		before = { menu_awesome },
		after = { menu_terminal },
	})
else
	M.mymainmenu = awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		},
	})
end

-- Menubar configuration
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it

-- Keyboard map indicator and switcher
M.mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
M.mytextclock = wibox.widget.textclock()

M.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = M.mymainmenu })

return M
