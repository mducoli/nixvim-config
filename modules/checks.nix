{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      checks = builtins.mapAttrs (
        n: v:
        inputs.nixvim.lib.${pkgs.system}.check.mkTestDerivationFromNvim {
          name = n;
          nvim = v;
        }
      ) self.packages.${pkgs.system};
    };
}
