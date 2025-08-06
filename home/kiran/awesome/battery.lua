local awful = require("awful")
local naughty = require("naughty")

-- Function to check battery and send notification
local function check_battery()
    awful.spawn.easy_async_with_shell("acpi -b", function(stdout)
        local battery_info = stdout:match("(%d?%d?%d)%%")
        local charging = stdout:match("Charging")
        local battery = tonumber(battery_info)

        if battery then
            if battery <= 10 and not charging then
                naughty.notify({
                    title = "Battery Low",
                    text = "Battery is at " .. battery .. "%!",
                    urgency = "critical",
                    timeout = 10,
                    position = "top_middle"
                })
            elseif battery >= 95 and charging then
                naughty.notify({
                    title = "Battery Full",
                    text = "Battery is at " .. battery .. "%, you can unplug the charger.",
                    urgency = "normal",
                    timeout = 5,
                    position = "top_middle"
                })
            end
        end
    end)
end

-- Call periodically (e.g. every 60 seconds)
local battery_timer = timer({ timeout = 60 })
battery_timer:connect_signal("timeout", check_battery)
battery_timer:start()

-- Optionally, run once on startup
check_battery()
