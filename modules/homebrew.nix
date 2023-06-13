{
  enable = true;

  # Updates homebrew on activation, but can make darwin-rebuild much slower:
  onActivation.autoUpdate = true;

  brews = [
    "jp2a"
    "dooit"
  ];

  casks = [
    "qutebrowser"
    "karabiner-elements"
    "firefox"
    "obs"
    "reaper"
    "launchcontrol"
    "google-chrome"
  ];
}
