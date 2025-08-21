{ lib, pkgs, ... }:
{
  plugins = {
    lsp.servers.intelephense = {
      enable = true;
      package = pkgs.intelephense;
    };
  };
}
