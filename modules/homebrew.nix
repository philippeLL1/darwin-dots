{
  enable = true;

  # Updates homebrew on activation, but can make darwin-rebuild much slower:
  # onActivation.autoUpdate = true;

  brews = [
    "jp2a"
  ];

  casks = [
    "qutebrowser"
    "karabiner-elements"
    "firefox"
    "obs"
    "reaper"
  ];
}
