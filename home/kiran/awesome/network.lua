-- Load AwesomeWM libraries
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

-- Function to create the wibox
local function create_hello_world_wibox()
    local s = awful.screen.focused()

    -- Create the wibox
    local mywibox = wibox({
        type = "normal",
        width = 200,
        height = 50,
        visible = true,
        ontop = true,
        screen = s,
        bg = "#008000"
    })

    -- Center the wibox on the screen
    mywibox.x = 100
    mywibox.y = 200

    -- Create a text widget
    local mytextwidget = wibox.widget {
        text   = "Hello World",
        align  = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }

    -- Add the text widget to the wibox
    mywibox:setup {
        layout = wibox.layout.align.horizontal,
        nil,
        mytextwidget,
        nil,
    }
end
