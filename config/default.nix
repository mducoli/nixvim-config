{ ... }: {
  imports = [
    ./mappings.nix
    ./lsp.nix
    ./ui.nix
  ];

  config = {
    options = {
      relativenumber = true;
      conceallevel = 2;
      concealcursor = "nc";
      shiftwidth = 2;
      tabstop = 2;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard.register = "unnamedplus";

    plugins = {
      treesitter = {
        enable = true;
        indent = true;
      };

      telescope.enable = true;
    };

    extraConfigLua = /* lua */ ''
      vim.filetype.add({
        extension = {
          templ = "templ",
        },
      })
    '';

  };
}
