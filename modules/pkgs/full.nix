{ inputs, config, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.default =
        inputs.nixvim.legacyPackages.${pkgs.stdenv.hostPlatform.system}.makeNixvimWithModule
          {
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
    };
}
