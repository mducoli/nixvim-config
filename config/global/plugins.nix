{
  plugins = {
    lsp.enable = true;

    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        snippet.expand =
          # lua
          ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
      };
    };

    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 1;
      };
    };

    luasnip.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
    telescope.enable = true;
    nabla.enable = true;
  };
}
