{ config, ... }:

{
  home.file.".config/hypr/hyprland.conf".text = ''
    # Some default env vars.
    env = XCURSOR_SIZE,24

    # Monitors.
    monitor=,1920x1080,0x0,1
    monitor=desc:Samsung Electric Company LU28R55 H4ZR400714, 3840x2160, auto-up, 1.5

    # Execute apps at launch.
    exec-once = waybar & firefox & kitty & brightnessctl set 0 -d platform::mute & wl-paste -t text --watch clipman store --no-persist & hyprpaper
    exec = nwg-dock-hyprland -d -i=54 -hd=0

    # Input config.
    input {
    	kb_layout = us
    	kb_variant =
    	kb_model =
    	kb_options =
    	kb_rules =

    	follow_mouse = 1

    	touchpad {
    		natural_scroll = no
    	}

    	sensitivity = 0.4 # -1.0 - 1.0, 0 means no modification.

    	repeat_delay = 250
    	repeat_rate = 40
    }

    general {
    	gaps_in = 6
    	gaps_out = 6
    	border_size = 3
    	col.active_border = rgb(${config.colorScheme.colors.base0D})
    	col.inactive_border = rgb(${config.colorScheme.colors.base01})
    	resize_on_border = true
    	layout = dwindle
    	allow_tearing = false
    }

    decoration {
    	rounding = 4
    	blur {
    		enabled = true
    		size = 5
    		passes = 2
    	}
    	drop_shadow = no
    	shadow_range = 4
    	shadow_render_power = 3
    }

    animations {
    	enabled = yes

    	# Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    	bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    	animation = windows, 1, 1, default
    	animation = windowsOut, 1, 2, default, popin 80%
    	animation = border, 1, 1, default
    	animation = borderangle, 1, 2, default
    	animation = fade, 1, 2, default
    	animation = workspaces, 1, 1, default
    }

    dwindle {
    	pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    	preserve_split = yes # you probably want this
    }

    master {
    	new_is_master = true
    }

    gestures {
    	workspace_swipe = on
    	workspace_swipe_invert = false
    }

    misc {
    	force_default_wallpaper = 0
    }


    # KEYMAPS
    # -------
    $mainMod = SUPER

    # App launcher.
    bind = ALT, SPACE, exec, rofi -show window
    bind = $mainMod, SPACE, exec, rofi -show drun

    # Bluetooth control via rofi.
    bind = ,code:245, exec, rofi-bluetooth

    # Audio.
    bind = ,code:121, exec, amixer set Master 0%
    bind = ,code:122, exec, amixer set Master 5%-
    bind = ,code:123, exec, amixer set Master 5%+

    # Brightness.
    bind = ,code:222, exec, brightnessctl set 10%- -d intel_backlight
    bind = ,code:223, exec, brightnessctl set 10%+ -d intel_backlight

    bindl = ,XF86MonBrightnessDown, exec, brightnessctl set 10%- -d intel_backlight
    bindl = ,XF86MonBrightnessUp, exec, brightnessctl set 10%+ -d intel_backlight

    bindl = ,XF86Favorites, exec, sh ~/.dotfiles/scripts/cycle_backlight.sh

    # Toggle Waybar.
    bind = ALT, w, exec, pkill -SIGUSR1 waybar


    bind = $mainMod, Q, exec, kitty
    bind = $mainMod, enter, exec, kitty
    bind = $mainMod, C, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = ALT SHIFT, v, exec, clipman pick -t rofi

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Move focus with mainMod + hjkl keys
    bind = ALT SHIFT, h, movefocus, l
    bind = ALT SHIFT, l, movefocus, r
    bind = ALT SHIFT, j, movefocus, d
    bind = ALT SHIFT, k, movefocus, u

    bind = $mainMod SHIFT, h, movewindow, l
    bind = $mainMod SHIFT, l, movewindow, r
    bind = $mainMod SHIFT, j, movewindow, d
    bind = $mainMod SHIFT, k, movewindow, u

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Example special workspace (scratchpad)
    bind = $mainMod, S, togglespecialworkspace, magic
    bind = $mainMod SHIFT, S, movetoworkspace, special:magic

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
  '';
}
