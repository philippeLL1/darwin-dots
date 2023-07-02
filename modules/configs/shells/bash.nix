{ pkgs, ... }:
{
  enable            = true;
  enableCompletion  = true;
  shellAliases = import ./aliases.nix;
  initExtra         = '' 
    eval "$(starship init bash)" 
    eval "$(zoxide init bash)"
    export PATH=$PATH:/Users/drawer/.scripts/bin
  '';
}
