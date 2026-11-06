-------------------------------------------------------
-- Key bindings
-- name: "Custom"
-- (ported from conf/keybindings/custom.conf)
-------------------------------------------------------

-- Configuration
local mainMod    = "SUPER" -- Sets "Windows" key as main modifier
local HYPRSCRIPTS = "~/.config/hypr/scripts"
local SCRIPTS     = "~/.config/ml4w/scripts"
local JETBRAINS   = "/opt/Jetbrains/scripts"
local OCR4Linux   = "~/.config/OCR4Linux/OCR4Linux.sh"

-- Applications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -replace -i"), { description = "Open application launcher" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/ml4w/settings/browser.sh"), { description = "Open the browser" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"), { description = "Open Visual Studio Code" })
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"), { description = "Open Discord" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("~/.config/ml4w/settings/filemanager.sh"), { description = "Open the filemanager" })
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("$(cat ~/.config/ml4w/settings/terminal.sh) htop"), { description = "Open htop" })
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("~/.config/ml4w/settings/emojipicker.sh"), { description = "Open the emoji picker" })
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox %u"), { description = "Open Jetbrains Toolbox" })
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/keybindings.sh"), { description = "Open keybindings" })
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(JETBRAINS .. "/webstorm"), { description = "Open Webstorm" })
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(JETBRAINS .. "/idea"), { description = "Open IntelliJ IDEA" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obs"), { description = "Open OBS Studio" })
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(JETBRAINS .. "/pycharm"), { description = "Open PyCharm" })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(JETBRAINS .. "/rider"), { description = "Open Rider .NET IDE" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("spotube"), { description = "Open Spotify" })
-- hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/waybar/themeswitcher.sh"), { description = "Open waybar theme switcher" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(SCRIPTS .. "/cliphist.sh"), { description = "Open clipboard manager" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/ml4w/settings/terminal.sh"), { description = "Open the terminal" })
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("virt-manager"), { description = "Open Virtual Machine Manager" })
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zeditor"), { description = "Open Zed text editor" })
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("~/.config/ml4w/apps/ML4W_Dotfiles_Settings-x86_64.AppImage"), { description = "Open ML4W Dotfiles Settings app" })
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("waypaper"), { description = "Open wallpaper selector" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(OCR4Linux .. " --lang all -l"), { description = "Open OCR4Linux" })

-- Display
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}")]]), { description = "Increase display zoom" })
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}")]]), { description = "Decrease display zoom" })
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"), { description = "Reset display zoom" })

-- Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"), { description = "Quit active window and all open instances" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Set active window to fullscreen" })
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "Maximize Window" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle active windows into floating mode" })
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"), { description = "Toggle all windows into floating mode" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }), { description = "Move focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }), { description = "Move focus up" })
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }), { description = "Move focus down" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window with the mouse" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window with the mouse" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true, description = "Increase window width with keyboard" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true, description = "Reduce window width with keyboard" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true, description = "Increase window height with keyboard" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true, description = "Reduce window height with keyboard" })
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "Toggle window group" })
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"), { description = "Swapsplit" })
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }), { description = "Swap tiled window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }), { description = "Swap tiled window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }), { description = "Swap tiled window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }), { description = "Swap tiled window down" })
-- hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { repeating = true, description = "Cycle between windows" })
-- hl.bind("ALT + Tab", hl.dsp.window.bring_to_top(), { repeating = true, description = "Bring active window to the top" })

-- Actions
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland configuration" })
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/custom-screenshot.sh"), { description = "Take a screenshot" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/custom-screenshot.sh"), { description = "Take a screenshot" })
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/toggle-animations.sh"), { description = "Toggle animations" })
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh"), { description = "Take a screenshot" })
-- hl.bind(mainMod .. " + ALT + F", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh --instant"), { description = "Take an instant full-screen screenshot" })
-- hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/screenshot.sh --instant-area"), { description = "Take an instant area screenshot" })
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exec_cmd("~/.config/ml4w/scripts/wlogout.sh"), { description = "Start wlogout" })
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("waypaper --random"), { description = "Change the wallpaper" })
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("waypaper"), { description = "Open wallpaper selector" })
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/wallpaper-automation.sh"), { description = "Start random wallpaper script" })
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -replace -i"), { description = "Open application launcher" })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/keybindings.sh"), { description = "Show keybindings" })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"), { description = "Reload waybar" })
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("~/.config/waybar/toggle.sh"), { description = "Toggle waybar" })
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/loadconfig.sh"), { description = "Reload hyprland config" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(SCRIPTS .. "/cliphist.sh"), { description = "Open clipboard manager" })
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("~/.config/waybar/themeswitcher.sh"), { description = "Open waybar theme switcher" })
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("flatpak run com.ml4w.settings"), { description = "Open ML4W Dotfiles Settings app" })
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/gamemode.sh"), { description = "Toggle game mode" })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/power.sh lock"), { description = "Lock screen" })
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/hyprshade.sh"), { description = "Toggle hyprshade" })
-- hl.bind("CTRL + Tab", hl.dsp.exec_cmd("~/.config/ml4w/scripts/focus.sh"), { description = "Open Select Window Menu" })

-- Sidepad
-- hl.bind(mainMod .. " + CTRL + right", hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh"), { description = "Open Sidepad" })
-- hl.bind(mainMod .. " + CTRL + left", hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh --hide"), { description = "Close Sidepad" })
-- hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh --init"), { description = "Init Sidepad" })
-- hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("~/.config/ml4w/scripts/sidepad.sh --select"), { description = "Select Sidepad" })

-- Workspaces
-- Switch workspaces with mainMod + [0-9] (key 0 maps to workspace 10)
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }), { description = "Open workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move active window to workspace " .. i })
    hl.bind(mainMod .. " + CTRL + " .. key,  hl.dsp.exec_cmd(HYPRSCRIPTS .. "/moveTo.sh " .. i), { description = "Move all windows to workspace " .. i })
end

hl.bind(mainMod .. " + Tab",         hl.dsp.focus({ workspace = "m+1" }), { description = "Open next workspace" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }), { description = "Open previous workspace" })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Open next workspace" })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Open previous workspace" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "empty" }), { description = "Open the next empty workspace" })

-- Fn keys
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/brightness.sh -i 20"), { description = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/brightness.sh -d 20"), { description = "Reduce brightness" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/brightness.sh -n"), { description = "Minimize brightness" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/brightness.sh -m"), { description = "Maximize brightness" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true, repeating = true, description = "Increase volume by 5%" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { locked = true, repeating = true, description = "Reduce volume by 5%" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { description = "Toggle mute" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Audio play pause" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { description = "Audio pause" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { description = "Toggle microphone" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("~/.config/ml4w/settings/calculator.sh"), { description = "Open calculator" })
hl.bind("XF86Lock", hl.dsp.exec_cmd("hyprlock"), { description = "Open screenlock" })
hl.bind("XF86Tools", hl.dsp.exec_cmd("flatpak run com.ml4w.settings"), { description = "Open ML4W Dotfiles Settings app" })

hl.bind("code:238", hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s +10"), { description = "Increase keyboard backlight" })
hl.bind("code:237", hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s 10-"), { description = "Reduce keyboard backlight" })
