{ pkgs, ... }:
{
  enable = true;
  doomPrivateDir = ./doom.d;
  extraPackages = with pkgs.emacsPackages; [ evil-collection ];
}
