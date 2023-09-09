{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    haumea.url = "github:nix-community/haumea/v0.2.2";
    devenv.url = "github:cachix/devenv/latest";
    spacebar.url = "github:cmacrae/spacebar/v1.4.0";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    darwin,
    haumea,
    devenv,
    spacebar,
    nix-doom-emacs,
    ...
  }:

  {

    darwinConfigurations."darwin-devel" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules =
        let
          # load all nix module files
          configModules = haumea.lib.load {
            src = ./modules;
            loader = haumea.lib.loaders.verbatim;
          };
        in
        [

          # ensures that the flake's inputs are visible to each module
          { _module.args = inputs; }

          # 󰣖  system
          configModules.systemPackages
          configModules.systemConfig

          #   user
          home-manager.darwinModules.home-manager {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            homebrew = configModules.homebrew;

            home-manager.users.drawer = configModules.userConfig;
            home-manager.extraSpecialArgs = { nix-doom-emacs = nix-doom-emacs; configModules = configModules; };
          }
        ];
    };
  };
}
