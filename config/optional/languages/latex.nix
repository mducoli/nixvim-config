{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers = {
      texlab.enable = true;
      ltex = {
        enable = true;
        settings.language = "it";
      };
    };

    conform-nvim.settings = {
      formatters_by_ft = {
        tex = [
          "latexindent"
        ];
      };

      formatters = {
        latexindent.command = "${pkgs.perl540Packages.LatexIndent}/bin/latexindent.pl";
      };
    };
  };
}
