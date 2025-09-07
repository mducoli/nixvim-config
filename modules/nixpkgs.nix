{ inputs, self, ... }:
{
  perSystem =
    { system, lib, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = builtins.attrValues self.overlays;
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (lib.getName pkg) [
            "intelephense"
          ];
      };
    };
}
