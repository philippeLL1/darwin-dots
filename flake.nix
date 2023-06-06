{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv.url = "github:cachix/devenv/latest";
    spacebar.url = "github:cmacrae/spacebar/v1.4.0";
    spacebar.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, haumea, devenv, spacebar, ... }: {

    darwinConfigurations."darwin-devel" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules =
        # recursively load all module files
        let
          modules = haumea.lib.load {
            src = ./modules;
            loader = haumea.lib.loaders.path;
          };
        in
        [
          # TODO: Put in a separate file
          {
            nixpkgs.overlays = [
              spacebar.overlay.aarch64-darwin
            ];
          }

          { _module.args = inputs; }
          # 󰣖  system
          modules.systemPackages
          modules.systemConfig
          #   user
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # TODO: put in separate file
            homebrew = {
              enable = true;
              onActivation.autoUpdate = true;
              # updates homebrew packages on activation,
              # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
              brews = [
                "jp2a"
              ];
              casks = [
                "qutebrowser"
                "karabiner-elements"
              ];
            };
            home-manager.users.drawer = import modules.userConfig;
          }
        ];
      inputs = { inherit devenv; };
    };
  };
}
