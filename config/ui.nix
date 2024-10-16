{pkgs, ...}: {
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "night";
    };
  };

  plugins = {
    lualine.enable = true;
    bufferline.enable = true;
    oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
        };
      };
    };
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
    web-devicons.enable = true;
  };

  extraPlugins = [
    pkgs.vimPlugins.bufdelete-nvim
  ];
}
