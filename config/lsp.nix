{
  plugins = {
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
      };
    };
  };
}
