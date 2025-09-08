return {
  nixpkgs = {
    expr = 'import (builtins.getFlake "' .. vim.fn.getcwd() .. '").inputs.nixpkgs {}',
  },
  options = {
    flake_parts = {
      expr = '(builtins.getFlake "' .. vim.fn.getcwd() .. '").debug.options',
    },
  },
}
