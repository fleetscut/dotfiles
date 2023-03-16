local awful = require("awful")
require("awful.autofocus")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local gears = require("gears")

local modkey = require("bindings.mods").modkey
local altkey = require("bindings.mods").altkey

local apps = require("config").apps
local menus = require("widgets.menus")

local bling = require("bling")
local machi = require("layout-machi")
local lain = require("lain")

local cyclefocus = require("cyclefocus")
cyclefocus.centered = true

awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "w", function()
		menus.mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	-- awful.key({ modkey }, "x", function()
	-- 	awful.prompt.run({
	-- 		prompt = "Run Lua code: ",
	-- 		textbox = awful.screen.focused().mypromptbox.widget,
	-- 		exe_callback = awful.util.eval,
	-- 		history_path = awful.util.get_cache_dir() .. "/history_eval",
	-- 	})
	-- end, { description = "lua execute prompt", group = "awesome" }),
	awful.key({ modkey }, "Return", function()
		awful.spawn(apps.terminal)
	end, { description = "open a terminal", group = "launcher" }),

	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ modkey }, "n", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "p", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "BackSpace", function()
		awful.util.spawn_with_shell(
			"dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"
		)
	end, { description = "Lock screen", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	-- awful.key({ modkey }, "Tab", function()
	-- 	awful.client.focus.history.previous()
	-- 	if _G.client.focus then
	-- 		_G.client.focus:raise()
	-- 	end
	-- end, { description = "go back", group = "client" }),

	awful.key({ modkey }, "k", function()
		awful.client.incwfact(-0.01)
	end, { description = "decrease client window factor of client", group = "layout" }),
	awful.key({ modkey }, "j", function()
		awful.client.incwfact(0.01)
	end, { description = "increase client window factor of client", group = "layout" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	-- awful.key({ modkey }, "space", function()
	-- 	awful.layout.inc(1)
	-- end, { description = "select next", group = "layout" }),
	-- awful.key({ modkey, "Shift" }, "space", function()
	-- 	awful.layout.inc(-1)
	-- end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ modkey }, "space", function()
		awful.util.spawn("rofi -show drun -theme /home/fleetscut/.config/rofi/launcher.rasi")
	end, { description = "run rofi app launcher", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.util.spawn("rofi -show run -theme /home/fleetscut/.config/rofi/launcher.rasi")
	end, { description = "run rofi command launcher", group = "launcher" }),

	-- Alt-Tab like function
	awful.key({ altkey }, "Tab", function(c)
		cyclefocus.cycle({ modifier = "Alt_R" })
	end, { description = "Cycle through all clients", group = "client" }),
	awful.key({ altkey, "Shift" }, "Tab", function(c)
		cyclefocus.cycle({ modifier = "Alt_R" })
	end, { description = "Cycle through all clients backwards", group = "client" }),

	-- Machi
	awful.key({ modkey }, ".", function()
		machi.default_editor.start_interactive()
	end, { description = "machi: edit the current machi layout", group = "layout" }),
	awful.key({ modkey }, "/", function()
		machi.switcher.start(client.focus)
	end, { description = "machi: switch between windows", group = "layout" }),

	--Lain
	awful.key({ modkey, ctrlkey }, "=", function()
		lain.util.useless_gaps_resize(1)
	end, { description = "increase gaps between windows", group = "awesome" }),

	awful.key({ modkey, ctrlkey }, "-", function()
		lain.util.useless_gaps_resize(-1)
	end, { description = "decrease gaps between windows", group = "awesome" }),

	-- Bling
	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "tabbed features",
		group = "client",
		on_press = function(index)
			if index == 1 then
				bling.module.tabbed.pick_with_dmenu()
			elseif index == 2 then
				bling.module.tabbed.pick_by_direction("down")
			elseif index == 4 then
				bling.module.tabbed.pick_by_direction("left")
			elseif index == 5 then
				bling.module.tabbed.iter()
			elseif index == 6 then
				bling.module.tabbed.pick_by_direction("right")
			elseif index == 7 then
				bling.module.tabbed.pick()
			elseif index == 8 then
				bling.module.tabbed.pick_by_direction("up")
			elseif index == 9 then
				bling.module.tabbed.pop()
			end
		end,
	}),

	-- Menubar
	-- awful.key({ modkey }, "p", function()
	-- 	menubar.show()
	-- end, { description = "show the menubar", group = "launcher" })

	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control", "Shift" },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),
})
