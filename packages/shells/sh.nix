let
  aliases = {
    l = "ls -la";
    ".." = "cd ..";
    nvimconfig = "cd ~/.config/nvim && nvim ./";
    nixconfig = "cd ~/.dotfiles && nvim ./";
    nixreload = "cd ~/.dotfiles && sudo nixos-rebuild switch --flake .#nixos-hyprland --show-trace";
    homereload = "cd ~/.dotfiles && home-manager switch --flake .";
    v = "nvim";
    gs = "git status";
    gp = "git push";
    tmfl = "tmuxifier load-session";
    tmfn = "tmuxifier new-session";
    tmfe = "nvim $TMUXIFIER_LAYOUT_PATH";
  };
in
{
  # ZSH
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = aliases;
    interactiveShellInit = ''
      eval $(thefuck --alias);
      export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts";
      export PATH=$HOME/.config/tmux/plugins/tmux-session-wizard/bin:$PATH
    '';
    ohMyZsh = {
      enable = true;
      theme = "half-life";
    };
  };
  # BASH
  programs.bash = {
    shellAliases = aliases;
  };
}
