{ config, ... }:

{
  home.file.".config/nwg-dock-hyprland/style.css".text = ''
    window {
      background: #${config.colorScheme.colors.base00};
      border-radius: 5px;
      border-style: solid;
      border-width: 2px;
      border-color: #${config.colorScheme.colors.base0D};
    }

    #box {
      /* Define attributes of the box surrounding icons here */
      padding: 10px
    }

    #active {
      /* This is to underline the button representing the currently active window */
      border-bottom: solid 1px;
      border-color: rgba(255, 255, 255, 0.3)
    }

    button, image {
      background: none;
      border-style: none;
      box-shadow: none;
      color: #999
    }

    button {
      padding: 4px;
      margin-left: 4px;
      margin-right: 4px;
      color: #eee;
      font-size: 12px
    }

    button:hover {
      background-color: #${config.colorScheme.colors.base01};
      border-radius: 2px;
    }

    button:focus {
      box-shadow: none
    }
  '';
}
