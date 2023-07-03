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
    "launchcontrol"
    "google-chrome"
    "thunderbird"
    "gimp"
    "vlc"
    "native-access"
    "blender"
    "obs-ndi"
    "utm"
    "gog-galaxy"
    "steam"
  ];
}
