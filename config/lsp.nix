{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # web
        html.enable = true;
        cssls.enable = true;
        svelte.enable = true;
        tsserver.enable = true;
        tailwindcss.enable = true;
        # go
        gopls.enable = true;
        templ.enable = true;
        # nix
        nil_ls.enable = true;
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
        ];
        snippet.expand =
          /*
          lua
          */
          ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
      };
    };

    cmp_luasnip.enable = true;

    none-ls = {
      enable = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          prettierd.enable = true;
        };
      };
    };

    nvim-autopairs.enable = true;
    luasnip.enable = true;
    comment.enable = true;
  };
}
