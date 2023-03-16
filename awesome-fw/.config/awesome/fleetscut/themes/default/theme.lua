local naughty = require("naughty")
local modkey = "Mod4"
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")

local myawesomemenu = {
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}
local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon } } })
local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

mytextclock = wibox.widget.textclock()

local cw = calendar_widget({
	start_sunday = "true",
	placement = "top_right",
	radius = 8,
})

mytextclock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		cw.toggle()
	end
end)

screen.connect_signal("request::desktop_decoration", function(s)
	--naughty.notify({text="Screen attached"})

	local names = {
		"main",
		"two",
	}
	local layouts = {
		awful.layout.layouts[1],
		awful.layout.layouts[3],
	}

	awful.tag(names, s, layouts)

	s.mypromptbox = awful.widget.prompt()

	-- Make this a custom widget
	s.mylayoutbox = awful.widget.layoutbox({
		screen = s,
		buttons = {
			awful.button({}, 1, function()
				awful.layout.inc(1)
			end),
			awful.button({}, 3, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 4, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 5, function()
				awful.layout.inc(1)
			end),
		},
	})

	-- Make this a custom widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if client.focut then
					client.focus:toggle_tag(t)
				end
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end),
		},
	})

	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate({ context = "tasklist", action = "toggle_minimization" })
			end),
			awful.button({}, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end),
			awful.button({}, 4, function()
				client.focus.byidx(-1)
			end),
			awful.button({}, 5, function()
				client.focus.byidx(1)
			end),
		},
	})

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		opacity = 0.8,
		margins = { top = 5, left = 8, bottom = 5, right = 8 },
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 10)
		end,
		widget = {
			layout = wibox.layout.align.horizontal,
			{
				layout = wibox.layout.fixed.horizontal,
				mylauncher,
				s.mytaglist,
				s.mypromptbox,
			},
			s.mytasklist,
			{
				layout = wibox.layout.fixed.horizontal,
				volume_widget({
					widget_type = "horizontal_bar",
				}),
				brightness_widget({
					type = "arc",
					program = "brightnessctl",
					step = 2,
				}),
				batteryarc_widget({
					show_current_level = true,
					arc_thickness = 1,
				}),
				wibox.widget.systray(),
				mytextclock,
				s.mylayoutbox,
			},
		},
	})
end)
