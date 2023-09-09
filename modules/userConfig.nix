{ pkgs, nix-doom-emacs, configModules, ... }:
let shellConfigs = configModules.configs.shells;
in
{
  imports = [ nix-doom-emacs.hmModule ];
  # doom emacs
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ../dotfiles/doom;
  };

  # direnv
  home.packages = configModules.userPackages pkgs;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  
  # shells
  programs.bash     = shellConfigs.bash pkgs;
  programs.zsh      = shellConfigs.zsh pkgs;
  programs.fish     = shellConfigs.fish pkgs;
  programs.nushell  = shellConfigs.nushell pkgs;

  programs.wezterm.enable = true;
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };


  # ~/.config/* files
  xdg = configModules.configs.xdg; 

  # neovim
  programs.neovim = configModules.configs.nvim pkgs;
  # emacs
  programs.emacs.enable = true;

  # prevents nix-darwin from building if set to true
  manual.manpages.enable = true;

  # git stuff 
  # TODO: put in another file
  programs.git = {
    userName = "philippeLL1";
    userEmail = "philippelouislatour@gmail.com";
  };

  # TODO: put in another file
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "/Users/drawer/.config/";
    ABCD = "hello";

    # Nap styling (snippet manager)
    NAP_BACKGROUND = "0";
    NAP_FOREGROUND = "7";
    NAP_PRIMARY_COLOR = "#ff79c6";
    NAP_PRIMARY_COLOR_SUBDUED = "#8F3A69"; 
  };

  # PATH
  home.sessionPath = [
    "$HOME/scripts/bin/"
    "$HOME/.jamtools/"
  ];

  programs.tmux.enable = true;
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
