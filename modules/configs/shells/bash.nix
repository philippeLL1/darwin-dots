{ pkgs, ... }:
{
  enable            = true;
  enableCompletion  = true;
  initExtra         = '' eval "$(starship init bash)" '';
}
