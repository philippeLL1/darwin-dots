{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    haumea.url = "github:nix-community/haumea/v0.2.2";
    devenv.url = "github:cachix/devenv/latest";
    spacebar.url = "github:cmacrae/spacebar/v1.4.0";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, haumea, devenv, spacebar, ... }: {

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
              # onActivation.autoUpdate = true;
              # updates homebrew packages on activation,
              # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
              brews = [
                "jp2a"
              ];
              casks = [
                "qutebrowser"
                "karabiner-elements"
                "firefox"
                "obs"
              ];
            };
            home-manager.users.drawer = import modules.userConfig;
          }
        ];
      inputs = { inherit darwin devenv nixpkgs; };
    };
  darwinPackages = self.darwinConfigurations."darwin-devel".pkgs;
  };
}
