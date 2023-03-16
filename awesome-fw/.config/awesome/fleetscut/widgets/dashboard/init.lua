local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local center = require("fleetscut.widgets.dashboard.center")

local function dashboard()
	local focus = awful.screen.focused()
	local bar_height = beautiful.bar_height
	local dashboard_width = focus.geometry.width
	local dashboard_height = focus.geometry.height
	local alpha = "cf"
	local launcher = "rofi -show-icons -modi windowcd,window,drun -show drun -filter "

	local dashboard = wibox({
		visible = false,
		ontop = true,
		type = "dock",
		screen = focus,
		x = focus.geometry.x,
		y = focus.geometry.y,
		width = dashboard_width,
		height = dashboard_height,
		bg = beautiful.base01 .. alpha,
	})

	local close_key = "Escape"
	local keygrabber = awful.keygrabber({
		keypressed_callback = function(_, mod, key)
			if key == close_key then
				awesome.emit_signal("dashboard_test::close")
				return
			end
			awful.spawn(launcher .. key)
			awesome.emit_signal("dashboard_test::close")
		end,
	})

	local function toggle_dashboard()
		dashboard.visible = not dashboard.visible

		if dashboard.visible then
			keygrabber:start()
		end
	end

	local function close_dashboard()
		dashboard.visible = false
		keygrabber:stop()
	end

	local function open_dashboard()
		dashboard.visible = true
		keygrabber:start()
	end

	awesome.connect_signal("dashboard_test::open", open_dashboard)
	awesome.connect_signal("dashboard_test::close", close_dashboard)

	dashboard:setup({
		nil,
		{
			nil,
			center,
			expand = "none",
			layout = wibox.layout.align.vertical,
		},
		expand = "none",
		layout = wibox.layout.align.horizontal,
	})

	return dashboard
end

return dashboard
