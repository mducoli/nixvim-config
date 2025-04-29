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
    in
    {
      checks = forEachSystem (
        pkgs:
        builtins.mapAttrs (
          n: v:
          nixvim.lib.${pkgs.system}.check.mkTestDerivationFromNvim {
            name = n;
            nvim = v;
          }
        ) outputs.packages.${pkgs.system}
      );

      packages = forEachSystem (
        pkgs: with nixvim.legacyPackages.${pkgs.system}; rec {

          minimal = makeNixvimWithModule {
            inherit pkgs;
            module = import ./config/global;
            extraSpecialArgs = { inherit outputs; };
          };

          full = minimal.extend {
            imports = [ ./config/full.nix ];
          };

          default = full;
        }
      );

      hydraJobs = {
        pkgs = outputs.packages;
      };
    };
}
