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
          # recursively load all module files
          modules = haumea.lib.load {
            src = ./modules;
            loader = haumea.lib.loaders.path;
          };
          hm = haumea.lib.load {
            src = ./modules;
            loader = haumea.lib.loaders.verbatim;
          };
        in
        [

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
            homebrew = hm.homebrew;
              
            home-manager.users.drawer = hm.userConfig;
            home-manager.extraSpecialArgs = { nix-doom-emacs = nix-doom-emacs; };
          }
        ];
    };
  };
}
