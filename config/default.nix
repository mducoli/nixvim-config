{
  imports = [
    ./mappings.nix
    ./lsp.nix
    ./ui.nix
  ];

  config = {
    options = {
      relativenumber = true;
    };

    globals = {
      mapleader = " ";
    };

    colorschemes.base16 = {
      enable = true;
      colorscheme = "onedark";
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
    };
  };
}
