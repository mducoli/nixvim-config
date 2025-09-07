{
  flake.modules.nixvim.php =
    { pkgs, ... }:
    {
      plugins = {
        lsp.servers.intelephense = {
          enable = true;
          package = pkgs.intelephense;
        };
      };
    };
}
