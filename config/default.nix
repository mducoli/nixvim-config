{
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
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    colorschemes.tokyonight = {
      enable = true;
      style = "night";
    };

    clipboard.register = "unnamedplus";

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;

      oil = {
        enable = true;
      };

      treesitter = {
        enable = true;
        indent = true;
      };

      nvim-tree = {
        enable = true;
      };

      toggleterm = {
        enable = true;
      };

      vim-bbye = {
        enable = true;
      };

      comment-nvim = {
        enable = true;
      };

      telescope = {
        enable = true;
      };
    };
  };
}
