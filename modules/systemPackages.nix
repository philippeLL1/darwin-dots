{ pkgs, devenv, spacebar, ... }: 
{
  nixpkgs.overlays = [ spacebar.overlay.aarch64-darwin ];
          
  environment.systemPackages = with pkgs; [
    # editors
    vim

    # shells
    nushell
    oil
    ion

    # utils
    bottom

    # devenv
    lua
    cachix
    devenv.defaultPackage.${pkgs.system}

    # services
    spacebar
    yabai
    skhd

    # apps

  ];
}
