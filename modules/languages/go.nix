{
  flake.modules.nixvim.go = {
    plugins = {
      lsp.servers = {
        gopls.enable = true;
        templ.enable = true;
      };
    };
  };
}
