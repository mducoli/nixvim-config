{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        html.enable = true;
        cssls.enable = true;
        nil_ls.enable = true;
        gopls.enable = true;
        tsserver.enable = true;
        svelte.enable = true;
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
        snippet.expand = /* lua */ ''
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
          nixpkgs_fmt.enable = true;
          prettierd.enable = true;
        };
      };
    };


    nvim-autopairs.enable = true;
    luasnip.enable = true;
    comment-nvim.enable = true;
  };
}
