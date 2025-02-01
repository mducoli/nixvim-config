{...}: {
  imports = [
    ./mappings.nix
    ./lsp.nix
    ./ui.nix
  ];

  opts = {
    relativenumber = true;
    conceallevel = 2;
    concealcursor = "nc";
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
    };

    telescope.enable = true;
  };

  extraConfigLua =
    /*
    lua
    */
    ''
      local null_ls = require("null-ls")

      -- Go Templ formatter
      local templ_formatter = {
        name = "templ_fmt",
        method = null_ls.methods.FORMATTING,
        filetypes = { "templ" },
        generator = null_ls.formatter({
          command = "templ",
          args = { "fmt" },
          to_stdin = true,
        }),
      }
      null_ls.register(templ_formatter)

      -- OpenTofu formatter
      local tofu_formatter = {
        name = "tofu_fmt",
        method = null_ls.methods.FORMATTING,
        filetypes = { "terraform", "tf", "terraform-vars" },
        generator = null_ls.formatter({
          command = "tofu",
          args = { "fmt", "-" },
          to_stdin = true,
        }),
      }
      null_ls.register(tofu_formatter)
    '';
}
