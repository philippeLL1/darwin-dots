{ pkgs, ... }:
{

  home.packages = import ./userPackages.nix pkgs;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # shells
  programs.bash.enable = true;
  programs.zsh = import ./configs/shells/zsh.nix pkgs;
  programs.fish = import ./configs/shells/fish.nix pkgs;

  programs.wezterm.enable = true;
  programs.wezterm.extraConfig = import ./configs/wezterm.nix;

  programs.neovim = import ./configs/nvim.nix pkgs;
  xdg.configFile.nvim = {
    source = ./configs/nvim;
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
  programs.tmux.enable = true;
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
