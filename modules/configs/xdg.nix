{ 
  configFile = {
    nvim = {
      source = ../../dotfiles/neovim;
      recursive = true;
    };
    sketchybar = {
      source = ../../dotfiles/sketchybar;
      recursive = true;
    };
    wezterm = {
      source = ../../dotfiles/wezterm;
      recursive = true;
    };
    xonsh = {
      source = ../../dotfiles/xonsh;
      recursive = true;
    };

  };
}
