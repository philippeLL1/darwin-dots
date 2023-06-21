{ pkgs, ... }:

{
  environment.pathsToLink = [ "/share/bash-completion" ];
  # dock 
  system.defaults.dock.show-recents = false;
  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = 0.5;
  # menu bar
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  # hot corners
  system.defaults.dock.wvous-tl-corner = 2;
  system.defaults.dock.wvous-tr-corner = 1;
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

  # trackpad gestures
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  # animations
  system.defaults.dock.expose-animation-duration = 0.1;

  # spaces
  system.defaults.dock.mru-spaces = false;
   
  # fonts
  fonts.fontDir.enable = true;
  fonts.fonts = [ pkgs.nerdfonts ];

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
#  nix.package = pkgs.nixUnstable;
  services.nix-daemon.enable = true;

  environment.variables = {
    ZVM_INIT_MODE = "sourcing";
    XDG_CONFIG_HOME = "~/.config";
  };

  users.users.drawer = {
    name = "drawer";
    home = "/Users/drawer/";
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # launch agents
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
