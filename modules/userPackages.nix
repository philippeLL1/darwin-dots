pkgs: with pkgs; [
  # gui
  kitty
  kitty-themes
  karabiner-elements
  wezterm
  vscodium
  sketchybar
  zathura
  karabiner-elements

  # tui
  fzf
  bottom
  wikicurses
  buku
  nap  
  pfetch
  more
  mprocs
  slides
  pipes

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
  pandoc
  gum
  fasd
  ion
  bitwarden-cli
  xonsh
  github-cli 

  # lsp
  haskell-language-server
  statix

  # dev
  rustc
  cargo
  lua
  go
  cmake
  (ghc.withPackages(ps: with ps; [ cassava ]))
  direnv
  nix-direnv
  git
  shellcheck
  direnv
  emscripten
  sqlite
  nodejs
  coreutils
  jupyter
  (python3.withPackages(ps: with ps; [ tensorflow matplotlib keras numpy pandas ]))
  vhs
  coursier
  metals

  # theming
  starship
  dwt1-shell-color-scripts


  # services
  yabai
  skhd
  spacebar


  # fonts
  iosevka
  jetbrains-mono
  montserrat

]
