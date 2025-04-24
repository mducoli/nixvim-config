{
  plugins = {
    lsp.servers = {
      html.enable = true;
      cssls.enable = true;
      svelte.enable = true;
      ts_ls.enable = true;
      tailwindcss.enable = true;
      eslint.enable = true;
      yamlls.enable = true;
    };

    none-ls.sources.formatting = {
      prettierd = {
        enable = true;
        disableTsServerFormatter = true;
      };
      rustywind.enable = true;
    };
  };
}
