{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.follows = "nixvim/nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    systems.url = "github:nix-systems/default-linux";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {

      systems = import inputs.systems;

      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree ./modules)
      ];

    };

  /*
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
            config.allowUnfree = true;
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
            };

            default = minimal.extend {
              imports = [ ./config/full.nix ];
            };
          }
        );

        hydraJobs = {
          pkgs = outputs.packages;
        };
      };
  */
}
