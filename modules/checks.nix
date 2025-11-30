{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      checks = builtins.mapAttrs (
        n: v:
        inputs.nixvim.lib.${pkgs.stdenv.hostPlatform.system}.check.mkTestDerivationFromNvim {
          name = n;
          nvim = v;
        }
      ) self.packages.${pkgs.stdenv.hostPlatform.system};
    };
}
