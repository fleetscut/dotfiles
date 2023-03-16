local naughty = require("naughty")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification {
		urgency = "critical",
		title = "Oops, an error happened"..(startup and " during startup!" or "!"),
		message = message
	}
end)

-- Handle runtime errors after startup
do
	local in_error = false
	_G.awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Other Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

naughty.connect_signal("debug::deprication", function(hint,see,asgs)
	naughty.notification {
		urgency = "critical",
		title = "Depricated API Call.",
		message = hint
	}
end)

