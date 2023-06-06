{ config, pkgs, ... }:

{

  # dock 
  system.defaults.dock.show-recents = false;
  system.defaults.dock.autohide = true;

  # menu bar
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  # hot corners
  system.defaults.dock.wvous-tl-corner = 2;
  system.defaults.dock.wvous-tr-corner = 12;
  system.defaults.dock.wvous-bl-corner = 4;
  system.defaults.dock.wvous-br-corner = 5;
  
  # keyboard
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 12;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  # spelling
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

  # icloud
  system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

  # finder
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
  system.defaults.finder = {
    CreateDesktop = false;
    FXDefaultSearchScope = "SCcf";
    FXEnableExtensionChangeWarning = false;
    QuitMenuItem = true;
    ShowPathbar = true;
  };

  launchd.user.agents.spacebar.serviceConfig.StandardErrorPath = "/tmp/spacebar.err.log";
  launchd.user.agents.spacebar.serviceConfig.StandardOutPath = "/tmp/spacebar.out.log";

  # trackpad gestures
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;
  # system.defaults.universalaccess = {
  #	closeViewScrollWheelToggle = true;
  #	closeViewZoomFollowsFocus = true;
  # };

  # spaces
  system.defaults.dock.mru-spaces = false;

  # services
  services.spacebar = {
    enable = true;
    package = pkgs.spacebar;
    config = import ./configs/spacebar.nix;
  };
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    config = import ./configs/yabai.nix;
  };
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = import ./configs/skhd.nix;
  };

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.nixUnstable;
  services.nix-daemon.enable = true;

  environment.variables = {
    ZVM_INIT_MODE = "sourcing";
    XDG_CONFIG_HOME = "~/.config";
  };

  users.users.drawer = {
    name = "drawer";
    home = "/Users/drawer/";
  };

  programs.zsh.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
