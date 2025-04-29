{ lib, pkgs, ... }:
{
  plugins = {
    jdtls = {
      enable = true;

      settings = {
        settings.java = {
          signatureHelp.enabled = true;
        };

        cmd = [
          "jdtls"
          {
            __raw = "'-data=' .. vim.fn.stdpath 'cache' .. '/jdtls/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')";
          }
        ];
      };
    };

    conform-nvim.settings = {
      formatters_by_ft = {
        java = [
          "google-java-format"
        ];
      };

      formatters = {
        google-java-format.command = lib.getExe pkgs.google-java-format;
      };
    };
  };
}
