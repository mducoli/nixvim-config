{ lib, ... }:
{
  flake.modules.nixvim.web =
    { pkgs, ... }:
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
          jsonls.enable = true;
        };

        conform-nvim.settings = {
          formatters_by_ft =
            (lib.genAttrs [
              "css"
              "scss"
              "less"
              "json"
              "jsonc"
              "yaml"
              "graphql"
              "handlebars"
              "astro"
              "htmlangular"
            ] (_: [ "prettier" ]))
            // (lib.genAttrs
              [
                "javascript"
                "javascriptreact"
                "typescript"
                "typescriptreact"
                "vue"
                "svelte"
                "html"
              ]
              (_: [
                "rustywind"
                "prettier"
              ])
            )
            // (lib.genAttrs [ "markdown" "markdown.mdx" ] (_: [
              "injected"
              "prettier"
            ]));

          formatters = {
            prettier.command = lib.getExe pkgs.nodePackages.prettier;
            rustywind.command = lib.getExe pkgs.rustywind;
          };
        };
      };
    };
}
