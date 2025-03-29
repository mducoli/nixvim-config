{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    }@inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs) lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          overlays = builtins.attrValues outputs.overlays;
        }
      );

      nixvimModule = pkgs: {
        inherit pkgs;
        module = import ./config;
      };
    in
    {
      checks = forEachSystem (pkgs: {
        default = nixvim.lib.${pkgs.system}.check.mkTestDerivationFromNixvimModule (nixvimModule pkgs);
      });

      packages = forEachSystem (pkgs: {
        default = nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule (nixvimModule pkgs);
      });

      overlays = import ./overlays { inherit inputs outputs; };
    };
}
