pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")

local themeName = "multicolor"
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/" .. themeName .. "/theme.lua")
--beautiful.init({
--	icon_font = "FiraCode",
--})

beautiful.useless_gap = 5

require("rules")
require("signals")

-- Mouse and Key bindings
require("bindings.global.mouse")
require("bindings.global.keys")

-- --- TODO
-- preserve layout after reload https://ch1p.io/awesome-reload-and-preserve-layout/
-- gaps
-- themes
-- tag icons
--
------ TEST ------
autorun = false
autorunApps = {
	"picom --experimental-backend",
}
if autorun then
	for app = 1, #autorunApps do
		awful.spawn.single_instance(autorunApps[app], awful.rules.rules)
	end
end

-- NEW

local dpi = require("beautiful.xresources").apply_dpi
local nice = require("nice")
local bling = require("bling")
local machi = require("layout-machi")
local lain = require("lain")

tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.floating,
		awful.layout.suit.tile,
		machi.default_layout,
		lain.layout.centerwork,
		lain.layout.termfair.center,
		bling.layout.mstab,
		-- awful.layout.suit.tile.left,
		-- awful.layout.suit.tile.bottom,
		-- awful.layout.suit.tile.top,
		-- awful.layout.suit.fair,
		-- awful.layout.suit.fair.horizontal,
		-- awful.layout.suit.spiral,
		-- awful.layout.suit.spiral.dwindle,
		-- awful.layout.suit.max,
		-- awful.layout.suit.max.fullscreen,
		-- awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
		-- awful.layout.suit.corner.ne,
		-- awful.layout.suit.corner.sw,
		-- awful.layout.suit.corner.se,
	})
end)
require("fleetscut.themes.default.theme")
local dashboard = require("fishlive.widget.dashboard")()
local dashboard_test = require("fleetscut.widgets.dashboard")()

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

nice({
	win_shade_enabled = true,
	titlebar_height = 29,
	titlebar_radius = 11,
	titlebar_font = "Iosevka Nerd Font 9",
	button_size = 13,
	button_margin_horizontal = 5,
	button_margin_top = 2,
	minimize_color = "#ffb400",
	maximize_color = "#4CBB17",
	close_color = "#ee4266",
	sticky_color = "#774f73",
	floating_color = "#774f73",
	ontop_color = "#774f73",
	titlebar_items = {
		left = { "sticky", "floating", "ontop" },
		middle = "title",
		right = { "minimize", "maximize", "close" },
	},
	tooltip_messages = {
		close = "Close",
		minimize = "Minimize",
		maximize_active = "Unmaximize",
		maximize_inactive = "Maximize",
		floating_active = "Floating",
		floating_inactive = "Tiling",
		ontop_active = "OnTop",
		ontop_inactive = "NotOnTop",
		sticky_active = "Sticky",
		sticky_inactive = "NotSticky",
	},
})

local modkey = "Mod4"
local altkey = "Mod1"

awful.keyboard.append_global_keybindings({
	-- Dashboard
	awful.key({ modkey }, "z", function()
		awesome.emit_signal("dashboard::toggle")
	end, { description = "Dashboard toggle", group = "awesome" }),
	awful.key({ modkey }, "x", function()
		awesome.emit_signal("dashboard_test::open")
	end, { description = "Dashboard toggle", group = "awesome" }),
})
