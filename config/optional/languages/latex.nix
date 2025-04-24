{ pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      texlab.enable = true;
      ltex = {
        enable = true;
        settings.language = "it";
      };
    };
  };

  extraConfigLua = ''
    local null_ls = require("null-ls")

    -- Latex indenter
    local latex_indenter = {
      name = "latexindent",
      method = null_ls.methods.FORMATTING,
      filetypes = { "tex" },
      generator = null_ls.formatter({
        command = "latexindent.pl",
        args = { },
        to_stdin = true,
      }),
    }
    null_ls.register(latex_indenter)
  '';

  extraPackages = with pkgs; [
    perl540Packages.LatexIndent
  ];
}
