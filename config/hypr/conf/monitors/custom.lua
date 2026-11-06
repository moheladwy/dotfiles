-------------------------------------------------------
-- Monitor Setup
-- name: "Custom Setup"
-------------------------------------------------------

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@100",
    position = "0x0",
    scale = 1
})

hl.monitor({
    output = "eDP-2",
    mode = "1920x1080@120",
    position = "1920x0",
    scale = 1
})
