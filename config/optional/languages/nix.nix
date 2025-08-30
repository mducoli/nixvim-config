{ pkgs, lib, ... }:
{
  plugins = {
    lsp.servers = {
      nixd = {
        enable = true;
        # Per project config loaded from .nixd.lua
        settings.__raw = ''
          (function()
            local default = {
              nixpkgs = {
                expr = 'import (builtins.getFlake "' .. vim.fn.getcwd() .. '").inputs.nixpkgs {}',
              },
              options = {
                nixos = {
                  expr = "{}",
                },
              },
            }

            local file = io.open(".nixd.lua", "r")
            if not file then
              return default
            end

            local content = file:read("*a")
            file:close()
            local status, result = pcall(load(content))
            if not status then
              return default
            end

            return result
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
  };
}
