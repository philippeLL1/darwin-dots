{ pkgs, devenv, ... }: {
  environment.systemPackages = with pkgs; [
    # editors
    vim
    # tools
    bottom
    # fonts
    nerdfonts
    hackgen-nf-font

    # devenv
    lua
    cachix
    devenv.defaultPackage.${pkgs.system}
  ];
}
