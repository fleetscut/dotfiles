-- http://pavelmakhov.com/awesome-wm-widgets/#tabAwesome_Buttons

local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

local create_button = function(button)
	local buttons_example = wibox({
		visible = true,
		bg = "#2E3440",
		ontop = true,
		height = 100,
		width = 1000,
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 3)
		end,
	})

	buttons_example:setup({
		button,
		valigh = "center",
		layout = wibox.container.place,
	})

	return buttons_example
end

local button_normal = wibox.widget({

	text = "A normal button",
	widget = wibox.widget.textbox,
})

local button_background = wibox.widget({
	{
		{
			text = "I have a background",
			widget = wibox.widget.textbox,
		},
		margins = 4,
		widget = wibox.container.margin,
	},
	bg = "#4C566A",
	shape_border_width = 1,
	shape_border_color = "#4C566A",
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
	widget = wibox.container.background,
})

local button_transparent = wibox.widget({
	{
		{
			text = "I am transparent",
			widget = wibox.widget.textbox,
		},
		margins = 4,
		widget = wibox.container.margin,
	},
	bg = "#00000000",
	widget = wibox.container.background,
})

local button_border = wibox.widget({
	{
		{
			text = "I have a border",
			widget = wibox.widget.textbox,
		},
		margins = 4,
		widget = wibox.container.margin,
	},
	bg = "#00000000",
	shape_border_width = 1,
	shap_border_color = "#4C566A",
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
	widget = wibox.container.background,
})

local button_effects = wibox.widget({
	{
		{
			text = "Mouse over me",
			widget = wibox.widget.textbox,
		},
		margins = 4,
		widget = wibox.container.margin,
	},
	bg = "#00000000",
	shape_border_width = 1,
	shap_border_color = "#4C566A",
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
	widget = wibox.container.background,
})

local button_cursor = wibox.widget({
	{
		{
			text = "Change the cursor",
			widget = wibox.widget.textbox,
		},
		margins = 4,
		widget = wibox.container.margin,
	},
	bg = "#00000000",
	shape_border_width = 1,
	shap_border_color = "#4C566A",
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
	widget = wibox.container.background,
})

local button_click = wibox.widget({
	{
		{
			text = "Click me!",
			widget = wibox.widget.textbox,
		},
		margins = 4,
		widget = wibox.container.margin,
	},
	bg = "#00000000",
	shape_border_width = 1,
	shap_border_color = "#4C566A",
	shape = function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 4)
	end,
	widget = wibox.container.background,
})

local test_list = {
	button_normal,
	button_background,
	button_transparent,
	button_border,
	button_effects,
	button_cursor,
	button_click,
}

local button_box = wibox.layout.fixed.horizontal()

for _, button in pairs(test_list) do
	button_box:add(wibox.widget({
		button,
		margins = 4,
		widget = wibox.container.margin,
	}))
end

button_effects:connect_signal("mouse::enter", function(c)
	c:set_bg("#00000066")
end)
button_effects:connect_signal("mouse::leave", function(c)
	c:set_bg("#4C566A")
end)

local old_cursor, old_wibox
button_cursor:connect_signal("mouse::enter", function(c)
	local wb = mouse.current_wibox
	old_cursor, old_wibox = mouse.current_wibox.cursor, mouse.current_wibox
	wb.cursor = "hand1"
end)
button_cursor:connect_signal("mouse::leave", function(c)
	c:set_bg("#4C566A")
	if old_wibox then
		old_wibox.cursor = old_cursor
		old_wibox = nil
	end
end)
button_click:connect_signal("button::press", function(c)
	c:set_bg("#000000")
end)
button_click:connect_signal("button::release", function(c)
	c:set_bg("#4C566A")
end)
local naughty = require("naughty")
button_click:connect_signal("button::press", function(c, _, _, button)
	if button == 1 then
		naughty.notify({ text = "Left click" })
	elseif button == 2 then
		naughty.notify({ text = "Wheel click" })
	elseif button == 3 then
		naughty.notify({ text = "Right click" })
	end
end)

awful.placement.top(create_button(button_box), { margins = { top = 40 }, parent = awful.screen.focused() })
