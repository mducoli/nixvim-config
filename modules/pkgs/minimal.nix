{ inputs, config, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.minimal = inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
        inherit pkgs;
        module = config.flake.modules.nixvim.core;
      };
    };
}
