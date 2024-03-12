{ pkgs, ... }: {
  colorschemes.tokyonight = {
    enable = true;
    style = "night";
  };

  plugins = {
    lualine.enable = true;
    bufferline.enable = true;
    oil.enable = true;
    nvim-tree.enable = true;
    toggleterm.enable = true;
    nvim-colorizer = {
      enable = true;
      fileTypes = [
        "*"
        {
          language = "svelte";
          tailwind = true;
        }
        {
          language = "css";
          css = true;
        }
      ];
    };
    indent-blankline.enable = true;
    gitsigns.enable = true;
  };

  extraPlugins = [
    pkgs.vimPlugins.bufdelete-nvim
  ];
}
