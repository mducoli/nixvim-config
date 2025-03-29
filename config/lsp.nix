{ pkgs, ... }:
{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # web
        html.enable = true;
        cssls.enable = true;
        svelte.enable = true;
        ts_ls.enable = true;
        tailwindcss.enable = true;
        eslint.enable = true;
        # yaml
        yamlls.enable = true;
        # go
        gopls.enable = true;
        templ.enable = true;
        # nix
        nil_ls.enable = true;
        # terraform
        terraformls.enable = true;
        # bash
        bashls.enable = true;
        # latex
        texlab.enable = true;
        ltex = {
          enable = true;
          settings.language = "it";
        };
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
        snippet.expand =
          # lua
          ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
      };
    };

    luasnip.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;

    none-ls = {
      enable = true;
      sources = {
        formatting = {
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rfc-style;
          };
          prettierd = {
            enable = true;
            disableTsServerFormatter = true;
          };
          rustywind.enable = true;
          shfmt.enable = true;
        };
      };
    };

    nvim-autopairs.enable = true;
    comment.enable = true;

    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 1;
      };
    };

    nabla.enable = true;
  };

  extraPackages = with pkgs; [
    perl540Packages.LatexIndent
  ];
}
