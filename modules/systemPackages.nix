{ pkgs, devenv, ... }: {
  environment.systemPackages = with pkgs; [
    # editors
    vim

    # utils
    bottom

    # fonts
    nerdfonts
    hackgen-nf-font

    # devenv
    lua
    cachix
    devenv.defaultPackage.${pkgs.system}

    # services
    spacebar
    yabai
    skhd
  ];
}
