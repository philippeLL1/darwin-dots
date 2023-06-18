pkgs: with pkgs; [
  # gui
  kitty
  kitty-themes
  karabiner-elements
  wezterm

  # tui
  fzf
  bottom
  wikicurses
  buku
  nap  
  pfetch
  most

  # cli
  lsd
  curl
  ripgrep
  glow
  wget
  fd
  jq
  bat
  leetcode-cli
  bat-extras.batdiff
  bat-extras.batgrep
  bat-extras.batpipe
  zoxide
  onefetch
  imagemagick

  # lsp
  haskell-language-server
  statix

  # dev
  rustc
  cargo
  nixpkgs-fmt
  lua
  go
  cmake
  ghc
  direnv
  nix-direnv
  git
  shellcheck
  direnv
  emscripten
  pyright
  sqlite
  nodejs
  coreutils
  jupyter
  tor
  (python3.withPackages(ps: with ps; [ tensorflow matplotlib keras numpy pandas ]))

  # theming
  starship
  dwt1-shell-color-scripts

  # services
  yabai
  skhd
  spacebar

  karabiner-elements
  # fonts
  iosevka
  jetbrains-mono

]
