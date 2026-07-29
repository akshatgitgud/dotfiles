------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1.25,
	vrr = 3,
})

-------------------
-- MY PROGRAMS ----
-------------------

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "tofi-drun -c ~/.config/tofi/configA --drun-launch=true"
local browser = "zen-browser --enable-features=UseOzonePlatform --ozone-platform=wayland"
local notes = "obsidian"
local editor = "code"
local editor_alt = "subl"
local colorPicker = "hyprpicker"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Polkit --
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

	-- Notifications --
	hl.exec_cmd("mako")

	-- Panel --
	hl.exec_cmd("hyprpanel")

	-- Clipboard history --
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Wallpaper
	hl.exec_cmd("awww-daemon --format xrgb")
	hl.exec_cmd("sleep 1 && awww img /home/monkey/Downloads/for.png")

	-- GVFS / MTP
	hl.exec_cmd("/usr/lib/gvfsd")
	hl.exec_cmd("/usr/lib/gvfs-mtp-volume-monitor")

	-- Automount removable drives
	hl.exec_cmd("udiskie")

	-- Vesktop
	hl.exec_cmd(
		"GDK_BACKEND=x11 ELECTRON_OZONE_PLATFORM_HINT=x11 vesktop --ozone-platform=x11 --enable-features=WebRTCPipeWireCapturer"
	)
end)

-----------------------------
-- ENVIRONMENT VARIABLES ----
-----------------------------

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- Toolkit
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

--- GENERALS --

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
})

---DWINDLE---
hl.config({
	dwindle = {
			preserve_split = true,
			force_split = 2, -- splits horizontally
		},

})

---MISC----
hl.config({
	misc = {
			force_default_wallpaper = 0, -- Disable mascot wallpapers
			disable_hyprland_logo = true, -- Disable Hyprland logo
			disable_splash_rendering = true,
			vrr = 0,
		},	
})
---XWAYLAND---
hl.config({
	xwayland = {
			force_zero_scaling = true,
		},

})

---GESTURES---
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

---DEVICES---
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
----------------
---DECORATION---
----------------
hl.config({
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = true,
            size = 8,
            passes = 2,
            new_optimizations = true,
            vibrancy = 0.1696,
            ignore_opacity = true,
        },
    },
})

-- Animation --

hl.curve("myBezier", {
	type = "bezier",
	points = {
		{ 0.05, 0.9 },
		{ 0.1, 1.05 },
	},
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 7,
	bezier = "myBezier",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 7,
	bezier = "myBezier",
	style = "popin",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 7,
	bezier = "myBezier",
	style = "popin",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 10,
	bezier = "myBezier",
	curve = "default",
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_options = "caps:escape",
		numlock_by_default = false,
		repeat_rate = 50,
		repeat_delay = 333,
		follow_mouse = 1,
		sensitivity = 0,
		scroll_factor = 2.0,
		accel_profile = "adaptive",
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
		},
	},
})

-----------------
----KEYBINDS-----
-----------------

--------------------
-- KEYBINDINGS
--------------------

local mainMod = "SUPER"

-- Applications
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + F", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("spotify-launcher"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd("jome -d | wl-copy"))

-- Window management
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))

-- Focus
hl.bind(mainMod .. " + LEFT",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + UP",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + DOWN",  hl.dsp.focus({ direction = "d" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.move({ direction = "l" }))

hl.bind(mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.move({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + UP",
    hl.dsp.window.move({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + DOWN",
    hl.dsp.window.move({ direction = "d" }))

-- Workspaces
for i = 1, 9 do
    hl.bind(
        mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = tostring(i) })
    )
end

hl.bind(
    mainMod .. " + 0",
    hl.dsp.focus({ workspace = "10" })
)

-- Move active window to a workspace
for i = 1, 9 do
    hl.bind(
        mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({
            workspace = tostring(i),
            follow = false,
        })
    )
end

hl.bind(
    mainMod .. " + SHIFT + 0",
    hl.dsp.window.move({
        workspace = "10",
        follow = false,
    })
)

--SPLITTING WORKSPACE--

hl.bind("SUPER + B",    hl.dsp.layout("swapsplit"))
hl.bind("SUPER + X",    hl.dsp.layout("splitratio +0.1"))
hl.bind("SUPER + Z",    hl.dsp.layout("splitratio -0.1"))

-- Workspace scrolling
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Mouse drag / resize
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Keyboard drag / resize
hl.bind(
    mainMod .. " + Z",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + X",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Resize active window (hold to repeat)
hl.bind(
    mainMod .. " + CTRL + RIGHT",
    hl.dsp.window.resize({ x = 30, y = 0, relative = true }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + CTRL + LEFT",
    hl.dsp.window.resize({ x = -30, y = 0, relative = true }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + CTRL + UP",
    hl.dsp.window.resize({ x = 0, y = -30, relative = true }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + CTRL + DOWN",
    hl.dsp.window.resize({ x = 0, y = 30, relative = true }),
    { repeating = true }
)

-- Volume
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
    { repeating = true }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"),
    { repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
)

-- Clipboard
hl.bind(
    "SUPER + V",
    hl.dsp.exec_cmd("cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy")
)

-- Color picker
hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd(colorPicker .. " | wl-copy")
)

-- Lock
hl.bind(
    "SUPER + L",
    hl.dsp.exec_cmd("hyprlock")
)

-- Logout
hl.bind(
    "SUPER + ESCAPE",
    hl.dsp.exec_cmd("wlogout")
)

-- HyprPanel
hl.bind(
    "CTRL + ESCAPE",
    hl.dsp.exec_cmd([[killall "gjs" || hyprpanel]])
)

-- Screenshots
local ss = "/home/monkey/screenshots"

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("grimblast copysave screen " .. ss .. "/$(date +'%Y-%m-%d_%H-%M-%S').png")
)

hl.bind(
    "SUPER + PRINT",
    hl.dsp.exec_cmd("grimblast copysave active " .. ss .. "/$(date +'%Y-%m-%d_%H-%M-%S').png")
)

hl.bind(
    "SUPER + ALT + PRINT",
    hl.dsp.exec_cmd("grimblast copysave area " .. ss .. "/$(date +'%Y-%m-%d_%H-%M-%S').png")
)

-- Media
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pamixer -i 5")
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pamixer -d 5")
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("pamixer --default-source -m")
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause")
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause")
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next")
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous")
)

-- Brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl s +5%")
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl s 5%-")
)

--SOME SPOTIFY DRAWER THINGY
hl.bind("SUPER + SPACE",    hl.dsp.workspace.toggle_special("Spotify"))

-------------------------------
---- WINDOW RULES -------------
-------------------------------

-- Opacity

for _, cls in ipairs({
	"Code",
	"Arduino IDE",
	"dev.warp.Warp",
	"obsidian",
	"code-url-handler",
	"code-insiders-url-handler",
	"kitty",
	"org.gnome.Nautilus",
	"org.kde.ark",
	"nwg-look",
	"qt5ct",
	"qt6ct",
	"kvantummanager",
}) do
	hl.window_rule({
		match = { class = "^(" .. cls .. ")$" },
		opacity = "0.80 0.80",
	})
end

for _, cls in ipairs({
	"pavucontrol",
	"blueman-manager",
	"nm-applet",
	"nm-connection-editor",
	"org.kde.polkit-kde-authentication-agent-1",
	"polkit-gnome-authentication-agent-1",
	"org.freedesktop.impl.portal.desktop.gtk",
	"org.freedesktop.impl.portal.desktop.hyprland",
}) do
	hl.window_rule({
		match = { class = "^(" .. cls .. ")$" },
		opacity = "0.80 0.70",
	})
end

hl.window_rule({
	match = { class = "^(Spotify)$" },
	opacity = "0.70 0.70",
})

hl.window_rule({
	match = { initial_title = "^(Spotify Free)$" },
	opacity = "0.70 0.70",
})

------------------------------------------------
-- Float rules
------------------------------------------------

for _, cls in ipairs({
	"kvantummanager",
	"qt5ct",
	"qt6ct",
	"nwg-look",
	"org.kde.ark",
	"pavucontrol",
	"blueman-manager",
	"nm-applet",
	"nm-connection-editor",
	"org.kde.polkit-kde-authentication-agent-1",
}) do
	hl.window_rule({
		match = { class = "^(" .. cls .. ")$" },
		float = true,
	})
end

------------------------------------------------
-- Workspaces
------------------------------------------------

hl.window_rule({
	match = { class = "^(zen|zen-alpha|zen-beta)$" },
	workspace = "1",
})

hl.window_rule({
	match = { class = "^(Spotify)$" },
	workspace = "2 silent",
})

hl.window_rule({
	match = { class = "^(steam)$" },
	workspace = "3 silent",
})

hl.window_rule({
	match = { class = "^(zen|zen-alpha|zen-beta)$" },
	fullscreen = true,
})

------------------------------------------------
-- Mario project
------------------------------------------------

hl.window_rule({
	match = {
		title = "^(Mario)$",
		class = "^$",
	},
	float = true,
	center = true,
	size = { 1080, 720 },
})

--SPOTIFY
hl.workspace_rule({
    workspace = "special:Spotify",
    gaps_in = 10,
    gaps_out = 20,
})
