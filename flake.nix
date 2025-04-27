{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.follows = "nixvim/nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      nixvim,
      ...
    }:
    let
      inherit (self) outputs;
      inherit (nixpkgs) lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
        }
      );

      fullModule = pkgs: {
        inherit pkgs;
        module = import ./config/all.nix;
      };

      minimalModule = pkgs: {
        inherit pkgs;
        module = import ./config/global;
      };
    in
    {
      checks = forEachSystem (
        pkgs: with nixvim.lib.${pkgs.system}.check; {
          full = mkTestDerivationFromNixvimModule (fullModule pkgs);
          minimal = mkTestDerivationFromNixvimModule (minimalModule pkgs);
        }
      );

      packages = forEachSystem (
        pkgs: with nixvim.legacyPackages.${pkgs.system}; rec {
          full = makeNixvimWithModule (fullModule pkgs);
          default = full;
          minimal = makeNixvimWithModule (minimalModule pkgs);
        }
      );

      hydraJobs = {
        pkgs = outputs.packages;
      };
    };
}
