{ config, ... }:

{
  home.file.".config/rofi/config.rasi".source = ./config.rasi;

  home.file.".config/rofi/theme.rasi".text = ''
    * {
      font:   "JetBrains Mono Nerd Font 14";


      bg0: #${config.colorScheme.colors.base00};
      bg1: #${config.colorScheme.colors.base02};

      fg0: #${config.colorScheme.colors.base04};

      accent-color: #${config.colorScheme.colors.base0D};
      urgent-color: #${config.colorScheme.colors.base0F};

      background-color:   transparent;
      text-color:         @fg0;

      margin:     0;
      padding:    0;
      spacing:    0;
    }

    window {
      location:   center;
      width:      800;
      background-color:   @bg0;

      border-radius: 8;
      border: 2px;
      border-color: @accent-color;
    }

    inputbar {
      spacing: 8px;
      padding: 8px;
      background-color: @bg1;
    }

    prompt, entry, element-icon, element-text {
      vertical-align: 0.5;
    }

    prompt {
      text-color: @accent-color;
    }

    textbox {
      padding: 8px;
      background-color: @bg1;
    }

    listview {
      padding: 4px 0;
      lines: 8;
      columns: 1;
      fixed-height: true;
    }

    element {
      padding:    8px;
      spacing:    8px;
    }

    element normal normal {
      text-color: @fg0;
    }

    element normal urgent {
      text-color: @urgent-color;
    }

    element normal active {
      text-color: @accent-color;
    }

    element selected {
      text-color: @bg0;
    }

    element selected normal, element selected active {
      background-color: @accent-color;
    }

    element selected urgent {
      background-color: @urgent-color;
    }

    element-icon {
      size: 1.75em;
    }

    element-text {
      text-color: inherit;
    }
  '';
}
