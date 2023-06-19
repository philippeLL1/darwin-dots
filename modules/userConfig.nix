{ pkgs, nix-doom-emacs, configModules, ... }:
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
  programs.bash.enable = true;
  programs.zsh = configModules.configs.shells.zsh pkgs;
  programs.fish = configModules.configs.shells.fish pkgs;

  programs.wezterm.enable = true;
  xdg.configFile.wezterm = {
    source = ../dotfiles/wezterm;
    recursive = true;
  };

  # neovim
  programs.neovim = configModules.configs.nvim pkgs;
  xdg.configFile.nvim = {
    source = ../dotfiles/neovim;
    recursive = true;
  };

  xdg.configFile.nap = {
    source = ../dotfiles/nap;
    recursive = true;
  };

  
  
  # emacs
  programs.emacs.enable = true;

  # prevents nix-darwin from building if set to true
  manual.manpages.enable = false;

  # git stuff 
  # TODO: put in another file
  programs.git = {
    userName = "philippeLL1";
    userEmail = "philippelouislatour@gmail.com";
  };

  # TODO: put in another file
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.tmux.enable = true;
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
