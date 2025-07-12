{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers.terraformls = {
      enable = true;
      package = pkgs.tofu-ls;
      cmd = [
        "opentofu-ls"
        "serve"
      ];
    };

    conform-nvim.settings = {
      formatters_by_ft = lib.genAttrs [ "terraform" "tf" "terraform-vars" ] (_: [
        "tofu_fmt"
      ]);

      formatters = {
        tofu_fmt.command = lib.getExe pkgs.opentofu;
      };
    };
  };
}
