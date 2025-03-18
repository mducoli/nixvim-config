{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib;

    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
      "aarch64-linux"
    ];

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        overlays = builtins.attrValues outputs.overlays;
      });

    nixvimModule = pkgs: {
      inherit pkgs;
      module = import ./config;
    };
  in {
    checks = forEachSystem (pkgs: let
      nixvimLib = nixvim.lib.${pkgs.system};
    in {
      default = nixvimLib.check.mkTestDerivationFromNixvimModule (nixvimModule pkgs);
    });

    packages = forEachSystem (pkgs: let
      nixvim' = nixvim.legacyPackages.${pkgs.system};
    in {
      default = nixvim'.makeNixvimWithModule (nixvimModule pkgs);
    });

    overlays = import ./overlays {inherit inputs outputs;};
  };
}
