local wibox = require("wibox")

local shapes = require("fleetscut/widgets/shapes")
local volume = require("fleetscut/widgets/dashboard/volume")
local calendar = require("fleetscut.widgets.calendar")
local clock = require("fleetscut.widgets.clock")

local box1 = shapes.create_box(volume(), 200, 200, 10)
local box2 = shapes.create_box(volume(), 200, 200, 10)
local cal_box = shapes.create_box(calendar, 200, 200, 10)
local clock_box = shapes.create_box(clock, 200, 200, 10)

local center = wibox.widget({
	{
		clock_box,
		cal_box,
		layout = wibox.layout.fixed.vertical,
	},
	layout = wibox.layout.fixed.horizontal,
})

return center
