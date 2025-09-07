{ inputs, config, ... }:
{
  perSystem =
    { pkgs, ... }:
    rec {
      packages.full = inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
        inherit pkgs;
        module.imports = with config.flake.modules.nixvim; [
          core
          # languages
          go
          sh
          nix
          web
          java
          latex
          terraform
          lua
          yaml
          c
          fsharp
          php
          typst
        ];
      };

      packages.default = packages.full;
    };
}
