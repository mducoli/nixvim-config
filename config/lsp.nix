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
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
      };
    };

    none-ls = {
      enable = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          prettierd.enable = true;
        };
      };
    };
  };
}
