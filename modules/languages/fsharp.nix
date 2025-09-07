{
  flake.modules.nixvim.fsharp =
    { pkgs, config, ... }:
    {
      extraPlugins = with pkgs.vimPlugins; [ Ionide-vim ];

      extraPackages = with pkgs; [
        fantomas
        config.plugins.lsp.servers.fsautocomplete.package
      ];
    };
}
