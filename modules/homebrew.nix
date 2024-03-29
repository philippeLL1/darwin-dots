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
    "reaper"
    "google-chrome"
    "gimp"
    "vlc"
    "native-access"
    "blender"
    "utm"
    "steam"
    "clion"
    "calibre"
    "docker"
    "jupyterlab"
    "wezterm"
  ];
}
