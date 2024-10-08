{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # web
        html.enable = true;
        cssls.enable = true;
        svelte.enable = true;
        ts-ls.enable = true;
        tailwindcss.enable = true;
        eslint.enable = true;
        # go
        gopls.enable = true;
        templ.enable = true;
        # nix
        nil-ls.enable = true;
        # terraform
        terraformls.enable = true;
      };
    };

    # Java
    nvim-jdtls = {
      enable = true;
      settings.settings.java = {
        signatureHelp.enabled = true;
      };
      data = ".nvim-jdtls";
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
          rustywind.enable = true;
        };
      };
    };

    nvim-autopairs.enable = true;
    luasnip.enable = true;
    comment.enable = true;
    web-devicons.enable = true;
  };
}
