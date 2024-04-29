let
  aliases = {
    l = "ls -la";
    ".." = "cd ..";
    nixconfig = "cd ~/.dotfiles && nvim ./";
    nvimconfig = "cd ~/.config/nvim && nvim ./";
    v = "nvim";
    gs = "git status";
    gp = "git push";
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
      eval $(thefuck --alias)
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
