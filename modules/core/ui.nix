{
  flake.modules.nixvim.core =
    { pkgs, ... }:
    {
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
        colorizer = {
          enable = true;
          settings = {
            filetypes = {
              __unkeyed-1 = "*";
              svelte.tailwind = true;
              css.css = true;
              typescriptreact.tailwind = true;
            };
            user_default_options = {
              always_update = true;
            };
          };
        };
        indent-blankline.enable = true;
        gitsigns.enable = true;
        web-devicons.enable = true;
        bufdelete.enable = true;
      };

      extraPackages = with pkgs; [ ripgrep ];
    };
}
