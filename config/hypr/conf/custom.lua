-------------------------------------------------------
-- Custom additional Hyprland configuration
-- name: "Custom"
-- (ported from conf/custom.conf)
-------------------------------------------------------

-- Add your additional Hyprland configurations here
--
-- This is an additional key binding
-- hl.bind("SUPER + CTRL + up", hl.dsp.focus({ workspace = "empty" }), { description = "Open the next empty workspace" })
--
-- Example for xwayland
-- hl.config({ xwayland = { force_zero_scaling = true } })

-- qt5ct environment variable
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- SDL version
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("XDG_MENU_PREFIX", "arch- kbuildsycoca6")
-- hl.env("SDL_VIDEODRIVER", "x11")

-- Pin workspaces to monitors
for i = 1, 6 do
    local monitor = i <= 3 and "HDMI-A-1" or "eDP-2"
    hl.workspace_rule({ workspace = "name:" .. i, monitor = monitor })
end

-- Load the XDG menu (runs on startup and on every config reload, like `exec`)
hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")

-- Blur for waybar
-- hl.layer_rule({ blur = true, match = { namespace = "waybar" } })

-- Run-once startup actions (like `exec-once`)
hl.on("hyprland.start", function()
    -- Dispatch the workspaces to the correct monitors
    hl.exec_cmd("hyprctl dispatch workspace 4")
    hl.exec_cmd("hyprctl dispatch workspace 1")

    -- Uncomment in case you have issues with screensharing
    -- hl.exec_cmd("~/.config/hypr/scripts/xdg.sh")

    -- Remove the spotube logs
    hl.exec_cmd("rm -r ~/.local/state/spotube/.spotube_logs")

    hl.exec_cmd("/usr/lib/pam_kwallet_init")
end)
