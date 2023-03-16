local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi


local function volume_bar()
	local bar = wibox.widget {
		value = 0.1,
		color = "#00FFFF",
		background_color = "#FFFFFF",
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 4)
		end,
		bar_shape = function(cr, w, h)
			gears.shape.partially_rounded_rect(cr, w, h, false, true, true, false, dpi(50))
		end,
		forced_height = 4,
		widget = wibox.widget.progressbar,
	}
	
	local bar_container = wibox.widget {
		{
			text = "Test",
			widget = wibox.widget.textbox
		},
		{
			bar,
			widget = wibox.container.margin
		},
		spacing = 8,
		layout = wibox.layout.fixed.horizontal
	}


	bar:connect_signal("button::press", function(_,_,_,button)
		if (button == 1) then
			bar.value = 0
		end
	end)

	return bar_container
end

return volume_bar
