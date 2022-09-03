pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.useless_gap = 5

require("layout")

require("rules")
require("signals")

-- Mouse bindings
_G.root.buttons(require("bindings").global.mouse)
-- Set keys
_G.root.keys(require("bindings").global.keys)

-- Table of layouts to cover with awful.layout.inc, order matters.
-- local function set_wallpaper(s)
-- 	-- Wallpaper
-- 	if beautiful.wallpaper then
-- 		local wallpaper = beautiful.wallpaper
-- 		-- If wallpaper is a function, call it with the screen
-- 		if type(wallpaper) == "function" then
-- 			wallpaper = wallpaper(s)
-- 		end
-- 		gears.wallpaper.maximized(wallpaper, s, true)
-- 	end
-- end
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)

--
-- Autostart applications
-- -pgrep -x xbanish > /dev/null || xbanish &-
--
-- --- TODO
-- preserve layout after reload https://ch1p.io/awesome-reload-and-preserve-layout/
-- vertical layout - bling
-- lain layouts
-- gaps
-- themes
-- tag icons
--
