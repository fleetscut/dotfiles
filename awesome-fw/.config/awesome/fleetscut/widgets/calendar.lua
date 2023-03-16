local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local calendar = wibox.widget({
	{
		date = os.date("*t"),
		widget = wibox.widget.calendar.month,
	},
	margins = 8,
	widget = wibox.container.margin,
})

return calendar
