{ pkgs, ... }:
{
  plugins = {
    lsp.servers.terraformls = {
      enable = true;
      package = pkgs.opentofu-ls;
      cmd = [
        "opentofu-ls"
        "serve"
      ];
    };

    none-ls.sources.formatting.opentofu_fmt.enable = true;
  };
}
