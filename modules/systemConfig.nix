{ pkgs, ... }:
{

  # System Settings
  system.defaults = { 

    # compositor options
    dock = {
      show-recents = false; 
      autohide = true;
      autohide-delay = 10000.;
      expose-animation-duration = 0.00001;
      mru-spaces = false;

      # hot corners
      wvous-tl-corner = 2;
      wvous-tr-corner = 1;
      wvous-bl-corner = 4;
      wvous-br-corner = 5;
    }; 

    # general options
    NSGlobalDomain = {
        _HIHideMenuBar = true;

        # spelling
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;

        # keyboard
        InitialKeyRepeat = 12;
        KeyRepeat = 2;

        # saving documents
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

    finder = {
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      ShowPathbar = true;
      AppleShowAllExtensions = true;

    };

    trackpad = { TrackpadThreeFingerDrag = true; };
  };


  fonts = { 
    fontDir.enable = true;
    fonts = [ pkgs.nerdfonts ]; 
  };

  services = { 
    # menu bar replacement
    spacebar = {
      enable = true;
      package = pkgs.spacebar;
      config = import ./configs/spacebar.nix;
    };
    # window manager
    yabai = {
      enable = true;
      package = pkgs.yabai;
      enableScriptingAddition = true;
      config = import ./configs/yabai.nix;
    };
    # keybinds daemon
    # skhd = {
    #   enable = true;
    #   package = pkgs.skhd;
    #   skhdConfig = import ./configs/skhd.nix;
    # }; 
    #
    nix-daemon.enable = true;
  };

  nix = {
    package = pkgs.nixUnstable; 
    extraOptions = ''experimental-features = nix-command flakes'';
  };

  environment = { 
    variables = {
      ZVM_INIT_MODE = "sourcing";
      XDG_CONFIG_HOME = "~/.config";
    }; 
  };

  users.users.drawer = {
    name = "drawer";
    home = "/Users/drawer/";
    shell = pkgs.bash;
  };

  programs.zsh.enable = true;
  programs.bash.enable = true;

  nixpkgs.config.allowUnfree = true;

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
