local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")

local M = {}
M.create_box = function(content, w, h, r)
	return wibox.widget({
		{
			{
				{
					nil,
					{
						nil,
						content,
						expand = "none",
						layout = wibox.layout.align.vertical,
					},
					expand = "none",
					layout = wibox.layout.align.horizontal,
				},
				margins = 8,
				widget = wibox.container.margin,
			},
			bg = beautiful.bg_normal,
			forced_width = dpi(w),
			forced_height = dpi(h),
			widget = wibox.container.background,
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, r)
			end,
		},
		margins = 8,
		layout = wibox.container.margin,
	})
end

return M
