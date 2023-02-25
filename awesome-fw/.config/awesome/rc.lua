pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.useless_gap = 5

require("rules")
require("signals")


-- NEW
local cyclefocus = require("cyclefocus")

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
------ TEST ------
-- require("test.test")


local machi = require("layout-machi")
local lain = require("lain")
local dpi = require("beautiful.xresources").apply_dpi
local nice = require("nice")

awful.layout.layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	machi.default_layout,
	lain.layout.centerwork,
	lain.layout.termfair.center,
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
}

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

  nice {
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
          left = {"sticky", "floating", "ontop"},
          middle = "title",
          right = {"minimize", "maximize","close"},
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
      }
  }

local modkey = "Mod4"
local altkey = "Mod1"

awful.keyboard.append_global_keybindings({

	awful.key({ modkey }, "Return", function()
		awful.spawn("kitty")
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", _G.awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", _G.awesome.quit, { description = "quit awesome", group = "awesome" }),
	--
	-- Prompt
	awful.key({ modkey }, "space", function()
		-- awful.screen.focused().mypromptbox:run()
		awful.util.spawn("rofi -show drun -theme /home/fleetscut/.config/rofi/launcher.rasi")
	end, { description = "run rofi app launcher", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "space", function()
		-- awful.screen.focused().mypromptbox:run()
		awful.util.spawn("rofi -show run -theme /home/fleetscut/.config/rofi/launcher.rasi")
	end, { description = "run rofi command launcher", group = "launcher" }),

	-- Alt-Tab like function
	awful.key({ altkey }, "Tab", function(c)
		cyclefocus.cycle({ modifier="Alt_L" })
	end,
	{ description = "Cycle through all clients", group = "client" }),
	awful.key({ altkey, "Shift" }, "Tab", function(c)
		cyclefocus.cycle({ modifier="Alt_L" })
	end,
	{ description = "Cycle through all clients backwards", group = "client" }),

	-- Machi
	awful.key({ modkey }, ".", function () machi.default_editor.start_interactive() end,
        {description = "machi: edit the current machi layout", group = "layout"}),
    awful.key({ modkey }, "/", function () machi.switcher.start(client.focus) end,
        {description = "machi: switch between windows", group = "layout"}),

	--Lain
	awful.key({ modkey, ctrlkey }, "=", function () lain.util.useless_gaps_resize(1) end,
              {description="increase gaps between windows", group="awesome"}),

    awful.key({ modkey, ctrlkey }, "-", function () lain.util.useless_gaps_resize(-1) end,
              {description="decrease gaps between windows", group="awesome"}),
})
