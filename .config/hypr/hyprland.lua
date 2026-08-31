-- Monitor Configuration
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = "1",
})

-- For any future external monitor use
hl.monitor({
	output = "",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
	mirror = "eDP-1",
})

-- Environmental Vars
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("HYPRSHOT_DIR", "/home/abdurehman/Pictures/Screenshots")

-- Window Rules

-- No rounding for Brave on the first workspace
hl.window_rule({
	match = {
		class = "brave-origin",
		workspace = "0",
	},
	rounding = 0,
})

-- Apps that should open in floating mode not tiled
hl.window_rule({
	match = {
		title = "Calculator",
	},
	float = 1,
})

hl.window_rule({
	match = {
		title = "Noctalia Settings",
	},
	float = 1,
})

-- Bitwarden Popup
hl.window_rule({
	match = {
		initial_title = "_crx_nngceckbapebfimnlniiiahkandclblb",
	},
	float = 1,
})

-- Workspace Rules
hl.workspace_rule({ workspace = "0", gaps_in = 0, gaps_out = 0 }) -- Special for Workspace 1
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })

-- General Look and Feel
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 8,

		border_size = 0,

		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			-- inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},

	-- gestures = {
	-- 	workspace_swipe_forever = true,
	-- },

	decoration = {
		rounding = 20,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.97,

		shadow = {
			enabled = true,
			range = 20,
			render_power = 4,
			-- color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 4,
			vibrancy = 0.2696,
			popups = true,
			new_optimizations = true,
			ignore_opacity = true,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0,
	},
})

-- Noctalia Shell Layer
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|background-.*)$",
	},
	no_anim = true,
	ignore_alpha = 0.4,
	blur = true,
	blur_popups = true,
})

-- Animations
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 10 })
hl.curve("fluid", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("snappy", { type = "bezier", points = { { 0.1, 1.05 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "snappy", style = "popin" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "snappy", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default", style = "popin" })

hl.animation({ leaf = "windowsMove", enabled = true, speed = 4.0, bezier = "snappy" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "snappy", style = "slide" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 8, curve = "default", style = "slidefade 20%" })

-- Mouse & Touchpad
hl.config({
	input = {
		kb_layout = "us,pk,ara",
		kb_variant = ", pak_urdu_phonetic, mac-phonetic",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0.9,

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Key Bindings Start
mainMod = "SUPER"

-- Window & Workspace Navigation/Movements Bindings
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize using keys
hl.bind(mainMod .. " + equal", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + minus", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focuse window with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Window Switching
hl.bind("ALT + TAB", hl.dsp.exec_cmd("noctalia msg window-switcher"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Screenshot Key Binding
-- hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"))

-- Media Keys Bindings
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Monitor Brightness Bindings
hl.bind(
	"XF86MonBrightnessUp",
	-- hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness increase"),
	hl.dsp.exec_cmd("noctalia msg brightness-up"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	-- hl.dsp.exec_cmd("qs -c noctalia-shell ipc call brightness decrease"),
	hl.dsp.exec_cmd("noctalia msg brightness-down"),
	{ locked = true, repeating = true }
)

-- Apps and Command Bindings
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("dolphin"))

-- Noctalia v5
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher /emo"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))

-- Noctalia v4
-- hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher clipboard"))
-- hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
-- hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call sessionMenu toggle"))
-- hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call controlCenter toggle"))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher emoji"))

-- Quickshell Lockscreen
hl.bind(mainMod .. " +SHIFT + L", hl.dsp.exec_cmd("~/.local/share/quickshell-lockscreen/lock.sh"))

-- Special Workspace Window Toggling
hl.bind("SUPER + X", function()
	if hl.get_workspace("special:minimized") then
		hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
		hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
	else
		hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
		hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
	end
end)

-- Start Up Commands
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
	hl.exec_cmd("noctalia -d && noctalia msg session lock") -- v5

	-- hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("qs -c noctalia-shell") -- v4
	hl.exec_cmd("bash -c 'wl-paste --watch cliphist store &'")
	hl.exec_cmd("kdeconnectd")
	hl.exec_cmd("wayneko --layer top --follow-pointer true")
	hl.exec_cmd("brave-origin", { workspace = 0 })
end)

-- For Noctalia Color templates
require("noctalia").apply_theme()
