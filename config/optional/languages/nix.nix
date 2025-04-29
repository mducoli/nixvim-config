{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers = {
      nixd = {
        enable = true;
        # Per project config loaded from .nixd.lua
        settings.__raw = ''
          (function ()
            local file = io.open(".nixd.lua", "r")
            if file then
              local content = file:read("*a")
              file:close()
              local re = load(content)
              return re()({
                system = "${pkgs.system}"
              })
            else
              return {
                nixpkgs = {
                  expr = 'import (builtins.getFlake "' .. vim.fn.getcwd() .. '").inputs.nixpkgs {}'
                },
                options = {
                  nixos = {
                    expr = "{}"
                  } 
                }
              }
            end
          end)()
        '';
      };
    };

    conform-nvim.settings = {
      formatters_by_ft = {
        nix = [
          "injected"
          "nixfmt"
        ];
      };

      formatters = {
        nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
      };
    };

    none-ls.sources = {
      diagnostics.deadnix.enable = true;
    };
  };
}
