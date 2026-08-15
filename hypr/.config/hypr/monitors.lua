-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
--hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

local desktop_monitor_scale = 1
local desktop_monitor_width = 3840
local desktop_monitor_height = 2160

local laptop_monitor_width = 2256
local laptop_monitor_height = 1504
local laptop_monitor_scale = omarchy_monitor_scale or 1.1175

local laptop_monitor_position_y = desktop_monitor_height

local laptop_monitor_position_x =
	math.floor((desktop_monitor_width - (laptop_monitor_width / laptop_monitor_scale)) / 2)

hl.monitor({
	output = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. AORUS FV43U 21340B000071",
	mode = string.format("%dx%d@%d", desktop_monitor_width, desktop_monitor_height, 60),
	position = "0x0",
	scale = desktop_monitor_scale,
	bitdepth = 10,
	cm = "hdr",
	supports_wide_color = 1,
	supports_hdr = 1,
	sdrbrightness = 0.9,
	sdrsaturation = 1.5,
	sdr_max_luminance = 1037,
	sdr_min_luminance = 0.0516,
})

hl.monitor({
	output = "eDP-1",
	mode = string.format("%dx%d@%d", laptop_monitor_width, laptop_monitor_height, 60),
	position = string.format("%dx%d", laptop_monitor_position_x, laptop_monitor_position_y),
	scale = omarchy_monitor_scale,
})
