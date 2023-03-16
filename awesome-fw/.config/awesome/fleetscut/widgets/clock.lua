local wibox = require("wibox")
local beautiful = require("beautiful")

local clock = wibox.widget({
	{
		{
			format = "%H",
			widget = wibox.widget.textclock(),
		},
		{
			text = ":",
			widget = wibox.widget.textbox(),
		},
		{
			format = "%M",
			widget = wibox.widget.textclock(),
		},
		{
			text = ":",
			widget = wibox.widget.textbox(),
		},
		{
			format = "%S",
			refresh = "1",
			widget = wibox.widget.textclock(),
		},
		spacing = 8,
		layout = wibox.layout.fixed.horizontal,
	},
	margin = 8,
	layout = wibox.container.margin,
})

return clock
