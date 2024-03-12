let
  map = mode: key: action: {
    inherit mode; inherit key; inherit action;
    options.silent = true;
  };

  maplua = mode: key: action: {
    inherit mode; inherit key; inherit action;
    lua = true;
    options.silent = true;
  };
in
{
  keymaps = [
    # General
    (map "n" "<Leader>w" "<cmd>w<CR>") # Save buffer
    (map "n" "<C-c>" "<cmd>%y+<CR>") # Copy buffer
    (map "n" "<Leader>x" "<cmd>Bdelete<CR>") # Delete buffer

    # Buffer bar
    (map "n" "<Tab>" "<cmd>bnext<CR>") # Next buffer
    (map "n" "<S-Tab>" "<cmd>bprevious<CR>") # Previous buffer

    # File tree
    (map "n" "<Leader>e" "<cmd>NvimTreeFocus<CR>") # Focus file tree
    (map "n" "<C-n>" "<cmd>NvimTreeToggle<CR>") # Toggle file tree
    (map "n" "<Leader>o" "<cmd>Oil<CR>") # Open Oil

    # Terminal
    (map [ "n" "t" ] "<A-h>" "<cmd>ToggleTerm size=15 direction=horizontal<CR>") # Horizontal terminal
    (map [ "n" "t" ] "<A-v>" "<cmd>ToggleTerm size=85 direction=vertical<CR>") # Vertical terminal

    # LSP
    (maplua "n" "<Leader>fm" "vim.lsp.buf.format") # Format buffer
    (maplua "n" "<Leader>fd" "vim.diagnostic.open_float") # Open floating diagnostic
    (maplua "n" "K" "vim.lsp.buf.hover") # Open information tooltip
    (maplua "n" "gD" "vim.lsp.buf.declaration") # Go to declaration
    (maplua "n" "gd" "vim.lsp.buf.definition") # Go to definition
    (maplua "n" "gi" "vim.lsp.buf.implementation") # Go to implementation
    (maplua "n" "gt" "vim.lsp.buf.type_definition") # Go to type definition
    (maplua "n" "gr" "vim.lsp.buf.references") # Show references
    (maplua "n" "<Leader>ca" "vim.lsp.buf.code_action") # Code action
    (maplua "n" "<Leader>ra" "vim.lsp.buf.rename") # Rename token

    # Telescope
    (map "n" "<Leader>fw" "<cmd>Telescope live_grep<CR>")
    (map "n" "<Leader>ff" "<cmd>Telescope find_files<CR>")
    (map "n" "<Leader>cm" "<cmd>Telescope git_commits<CR>")
    (map "n" "<Leader>gt" "<cmd>Telescope git_status<CR>")
  ];

  plugins.cmp.settings.mapping = {
    "<C-Space>" = "cmp.mapping.complete()";
    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
    "<CR>" = "cmp.mapping.confirm({ select = true })";
  };

  plugins.comment-nvim = {
    toggler.line = "<Leader>/";
    opleader.line = "<Leader>/";
  };
}
