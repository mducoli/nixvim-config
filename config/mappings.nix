{
  keymaps = [
    # General
    {
      action = "<cmd>w<CR>";
      key = "<Leader>w";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>%y+<CR>";
      key = "<C-c>";
      mode = "n";
      options.silent = true;
    }
    # Buffer bar
    {
      action = "<cmd>bnext<CR>";
      key = "<Tab>";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>bprevious<CR>";
      key = "<S-Tab>";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>Bdelete<CR>";
      key = "<Leader>x";
      mode = "n";
      options.silent = true;
    }
    # File tree
    {
      action = "<cmd>NvimTreeFocus<CR>";
      key = "<Leader>e";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-n>";
      mode = "n";
      options.silent = true;
    }
    # Terminal
    {
      action = "<cmd>ToggleTerm size=15 direction=horizontal<CR>";
      key = "<A-h>";
      mode = ["n" "t"];
      options.silent = true;
    }
    {
      action = "<cmd>ToggleTerm size=85 direction=vertical<CR>";
      key = "<A-v>";
      mode = ["n" "t"];
      options.silent = true;
    }
    # LSP
    {
      action = "vim.lsp.buf.format";
      key = "<Leader>fm";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.diagnostic.open_float";
      key = "<Leader>fd";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    # TODO add telescope
  ];

  plugins.cmp.settings.mapping = {
    "<C-Space>" = "cmp.mapping.complete()";
    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
    "<CR>" = "cmp.mapping.confirm({ select = true })";
  };

  plugins.comment-nvim = {
    toggler = {
      line = "<Leader>/";
    };
    opleader = {
      line = "<Leader>/";
    };
  };
}
