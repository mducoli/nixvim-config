let
  map = mode: key: action: {
    inherit mode;
    inherit key;
    action = ''<cmd>${action}<CR>'';
    options.silent = true;
  };

  maplua = mode: key: action: {
    inherit mode;
    inherit key;
    action.__raw = ''function() ${action} end'';
    options.silent = true;
  };
in {
  keymaps = [
    # General
    (map "n" "<Leader>w" "w") # Save buffer
    (map "n" "<C-c>" "%y+") # Copy buffer
    (map "n" "<Leader>x" "Bdelete") # Delete buffer
    (map "n" "<Leader>q" "confirm q") # Quit

    # Buffer bar
    (map "n" "<Tab>" "bnext") # Next buffer
    (map "n" "<S-Tab>" "bprevious") # Previous buffer

    # File tree
    (map "n" "<Leader>e" "NvimTreeFocus") # Focus file tree
    (map "n" "<C-n>" "NvimTreeToggle") # Toggle file tree
    (map "n" "<Leader>o" "Oil") # Open Oil

    # Terminal
    (map ["n" "t"] "<A-h>" "ToggleTerm size=15 direction=horizontal") # Horizontal terminal
    (map ["n" "t"] "<A-v>" "ToggleTerm size=85 direction=vertical") # Vertical terminal

    # LSP
    (maplua "n" "<Leader>fm" "CustomFormat()") # defined below
    (maplua "n" "<Leader>fd" "vim.diagnostic.open_float()") # Open floating diagnostic
    (maplua "n" "K" "vim.lsp.buf.hover()") # Open information tooltip
    (maplua "n" "gD" "vim.lsp.buf.declaration()") # Go to declaration
    (maplua "n" "gd" "vim.lsp.buf.definition()") # Go to definition
    (maplua "n" "gi" "vim.lsp.buf.implementation()") # Go to implementation
    (maplua "n" "gt" "vim.lsp.buf.type_definition()") # Go to type definition
    (maplua "n" "gr" "vim.lsp.buf.references()") # Show references
    (maplua "n" "<Leader>ca" "vim.lsp.buf.code_action()") # Code action
    (maplua "n" "<Leader>ra" "vim.lsp.buf.rename()") # Rename token

    # Telescope
    (map "n" "<Leader>fw" "Telescope live_grep")
    (map "n" "<Leader>ff" "Telescope find_files")
    (map "n" "<Leader>cm" "Telescope git_commits")
    (map "n" "<Leader>gt" "Telescope git_status")

    # Luasnip
    (maplua ["i" "s"] "<C-L>" "require('luasnip').jump(1)")
    (maplua ["i" "s"] "<C-J>" "require('luasnip').jump(-1)")

    # Nabla
    (maplua "n" "<Leader>p" "require('nabla').popup()")
  ];

  plugins = {
    cmp.settings.mapping = {
      "<C-Space>" = "cmp.mapping.complete()";
      "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
    };

    comment.settings = {
      toggler.line = "<Leader>/";
      opleader.line = "<Leader>/";
    };

    nvim-surround.enable = true;
  };

  extraConfigLua = ''
    -- Format buffer only with null-ls if available
    function CustomFormat()
      local null_ls_sources = require('null-ls.sources')
      local ft = vim.bo.filetype

      local has_null_ls = #null_ls_sources.get_available(ft, 'NULL_LS_FORMATTING') > 0

      vim.lsp.buf.format({
        filter = function(client)
          if has_null_ls then
            return client.name == 'null-ls'
          else
            return true
          end
        end,
      })
    end
  '';
}
