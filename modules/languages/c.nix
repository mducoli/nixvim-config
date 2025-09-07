{
  flake.modules.nixvim.c = {
    plugins = {
      lsp.servers = {
        clangd.enable = true;
      };
    };
  };
}
