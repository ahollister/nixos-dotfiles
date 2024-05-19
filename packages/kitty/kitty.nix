{ config, ... }:

{
  home.file.".config/kitty/kitty.conf".text = ''
    font_family        JetBrains Mono
    font_size          12
    background_opacity 0.9

    # Default scrollback pager
    scrollback_pager ~/.config/kitty/pager.sh 'INPUT_LINE_NUMBER' 'CURSOR_LINE' 'CURSOR_COLUMN'

    # Launch vim buffer with scrollback content.
    map Alt+v launch --type overlay --stdin-source=@screen_scrollback ~/.dotfiles/scripts/scrollback.sh


    # Colors - dark + light shades.
    # -----------------------------

    # Black
    color0 #${config.colorScheme.colors.base02}
    color8 #${config.colorScheme.colors.base03}
    # Red
    color1 #${config.colorScheme.colors.base0F}
    color9 #${config.colorScheme.colors.base0F}
    # Green
    color2  #${config.colorScheme.colors.base0B}
    color10 #${config.colorScheme.colors.base0B}
    # Yellow
    color3  #${config.colorScheme.colors.base0A}
    color11 #${config.colorScheme.colors.base0A}
    # Blue
    color4  #${config.colorScheme.colors.base0D}
    color12 #${config.colorScheme.colors.base0C}
    # Magenta
    color5  #${config.colorScheme.colors.base0E}
    color13 #${config.colorScheme.colors.base0E}
    # Cyan
    color6  #${config.colorScheme.colors.base0A}
    color14 #${config.colorScheme.colors.base0D}
    # White
    color7  #${config.colorScheme.colors.base06}
    color15 #${config.colorScheme.colors.base07}

    # Marks
    mark1_background #${config.colorScheme.colors.base00}
    mark1_foreground #${config.colorScheme.colors.base0A}

    mark2_background #${config.colorScheme.colors.base00}
    mark2_foreground #${config.colorScheme.colors.base0E}

    mark3_background #${config.colorScheme.colors.base00}
    mark3_foreground #${config.colorScheme.colors.base0F}

  '';
}
