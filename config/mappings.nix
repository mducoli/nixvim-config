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
    {
      action = "vim.lsp.buf.hover";
      key = "K";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.lsp.buf.declaration";
      key = "gD";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.lsp.buf.definition";
      key = "gd";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.lsp.buf.implementation";
      key = "gi";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.lsp.buf.type_definition";
      key = "gt";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.lsp.buf.references";
      key = "gr";
      mode = "n";
      lua = true;
      options.silent = true;
    }
    {
      action = "vim.lsp.buf.code_action";
      key = "<Leader>ca";
      mode = "n";
      lua = true;
      options.silent = true;
    }

    # Telescope
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<Leader>fw";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<Leader>ff";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<Leader>cm";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>Telescope git_status<CR>";
      key = "<Leader>gt";
      mode = "n";
      options.silent = true;
    }

    # Oil
    {
      action = "<cmd>Oil<CR>";
      key = "<Leader>o";
      mode = "n";
      options.silent = true;
    }
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
