{
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

    keymaps = [
      {
        action = ":bnext<CR>";
        key = "<Tab>";
        mode = "n";
        options.silent = true;
      }
      {
        action = ":bprevious<CR>";
        key = "<S-Tab>";
        mode = "n";
        options.silent = true;
      }
      {
        action = ":bp<bar>sp<bar>bn<bar>bd<CR>"; # prevent nvim-tree to focus after closing a buffer
        key = "<Leader>x";
        mode = "n";
        options.silent = true;
      }
      {
        action = "vim.lsp.buf.format";
        key = "<Leader>fm";
        mode = "n";
        lua = true;
        options.silent = true;
      }
      {
        action = ":NvimTreeFocus<CR>";
        key = "<Leader>e";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>:ToggleTerm size=15 direction=horizontal<CR>";
        key = "<A-h>";
        mode = ["n" "t"];
        options.silent = true;
      }
    ];

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          gopls.enable = true;
          tsserver.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };

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
    };
  };
}
