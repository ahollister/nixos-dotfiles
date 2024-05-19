{ config, ... }:

{
  home.file.".config/waybar/config.jsonc".text = ''
    {
      "height": 40,
      "reload_style_on_change": true,
      "layer": "top",
      "position": "top",
      "modules-center": [],
      "modules-left": ["hyprland/workspaces"],
      "modules-right": ["network", "temperature", "memory", "cpu", "pulseaudio", "battery", "clock"],
      "hyprland/workspaces": {
        "format": "{icon}",
        "format-icons": {
          "active": "",
          "default": ""
        }
      },
      "network": {
        "format": "{ifname}",
        "format-wifi": "  {essid} ({signalStrength}%)",
        "format-ethernet": "  {ifname}",
        "format-disconnected": "",
        "tooltip-format": "{ifname}",
        "tooltip-format-wifi": "  {essid} ({signalStrength}%)",
        "tooltip-format-ethernet": "  {ifname}",
        "tooltip-format-disconnected": "Disconnected",
        "max-length": 50
      },
      "temperature": {
        "hwmon-path": "/sys/devices/platform/coretemp.0/hwmon/hwmon8/temp1_input",
        "critical-threshold": 80,
        "format-critical": "<span color='#${config.colorScheme.colors.base0F}'>  {temperatureC}°C</span>",
        "format": "  {temperatureC}°C"
      },
      "cpu": {
        "interval": 5,
        "format": "  {icon0} {icon1} {icon2} {icon3} {usage}%",
        "format-icons": ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"]
      },
      "memory": {
        "interval": 10,
        "format": "  {used:0.1f}/{total:0.1f}G"
      },
      "clock": {
        "format": "{:%H:%M - %a %b %d %Y}",
        "format-alt": "{:%A, %B %d, %Y (%R)}  ",
        "tooltip-format": "<tt><small>{calendar}</small></tt>",
        "calendar": {
          "mode": "year",
          "mode-mon-col": 3,
          "weeks-pos": "right",
          "on-scroll": 1,
          "format": {
            "months": "<span color='#${config.colorScheme.colors.base08}'><b>{}</b></span>",
            "days": "<span color='#${config.colorScheme.colors.base05}'><b>{}</b></span>",
            "weeks": "<span color='#${config.colorScheme.colors.base0B}'><b>W{}</b></span>",
            "weekdays": "<span color='#${config.colorScheme.colors.base0E}'><b>{}</b></span>",
            "today": "<span color='#${config.colorScheme.colors.base0F}'><b><u>{}</u></b></span>"
          }
        }
      },
      "pulseaudio": {
        "format": "{icon}  {volume}%",
        "format-bluetooth": "<span color='#${config.colorScheme.colors.base0A}'>{icon} </span>  {volume}%",
        "format-muted": "<span color='#${config.colorScheme.colors.base0F}'></span>",
        "format-icons": {
          "bluetooth": "",
          "headphones": "",
          "handsfree": "",
          "headset": "",
          "phone": "",
          "portable": "",
          "car": "",
          "default": ["", ""]
        },
        "scroll-step": 1,
        "on-click": "alsamixer"
      },
      "battery": {
          "states": {
              "warning": 30,
              "critical": 15
          },
          "format": "<span color='#${config.colorScheme.colors.base0B}'>{icon}</span>  {capacity}%",
          "format-charging": "<span color='#${config.colorScheme.colors.base08}'>󱐋</span>  {capacity}%",
          "format-plugged": "<span color='#${config.colorScheme.colors.base0B}'> </span> {capacity}%",
          "format-warning": "<span color='#${config.colorScheme.colors.base0F}'>{icon}</span>  {capacity}%",
          "format-critical": "<span color='#${config.colorScheme.colors.base0F}'>{icon}  {capacity}%</span> ",
          "format-alt": "{icon} {time}",
          "format-icons": ["", "", "", "", ""]
      },
      "actions": {
        "on-click-right": "mode",
        "on-click-forward": "tz_up",
        "on-click-backward": "tz_down",
        "on-scroll-up": "shift_up",
        "on-scroll-down": "shift_down"
      }
    }
  '';


  home.file.".config/waybar/style.css".text = ''
    * {
      font-family: "JetBrains Mono Nerd Font", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
      font-size: 15px;
      font-weight: bold;
    }

    window#waybar {
      background: transparent;
      color: #${config.colorScheme.colors.base08};
    }

    #workspaces button {
      padding: 0 6px;
      color: #${config.colorScheme.colors.base08};
    }

    #workspaces button.active {
      color: #${config.colorScheme.colors.base0E};
    }

    #workspaces,
    #clock,
    #battery,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #backlight,
    #network,
    #pulseaudio,
    #wireplumber,
    #custom-media,
    #tray,
    #mode,
    #idle_inhibitor,
    #scratchpad,
    #power-profiles-daemon,
    #mpd {
      background: #${config.colorScheme.colors.base01};
      color: #${config.colorScheme.colors.base0C};
      border: 2px solid #${config.colorScheme.colors.base0A};
      border: none;
      border-radius: 4px;
      padding: 2px 10px;
      margin: 4px 5px 0 5px;
    }

    #workspaces {
      padding: 2px 10px 2px 6px;
    }

    #clock {
      color: #${config.colorScheme.colors.base0E};
    }
  '';
}
