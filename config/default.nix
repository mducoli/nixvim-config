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
      shiftwidth = 2;
      tabstop = 2;
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
      treesitter = {
        enable = true;
        indent = true;
      };

      lualine.enable = true;
      bufferline.enable = true;
      oil.enable = true;
      nvim-tree.enable = true;
      toggleterm.enable = true;
      vim-bbye.enable = true;
      comment-nvim.enable = true;
      telescope.enable = true;
      cmp_luasnip.enable = true;
      luasnip.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
    };

  };
}
