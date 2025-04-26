return function(a)
  return {
    nixpkgs = {
      expr = 'import (builtins.getFlake "' .. vim.fn.getcwd() .. '").inputs.nixpkgs {}'
    },
    options = {
      nixvim = {
        expr = '(builtins.getFlake "' .. vim.fn.getcwd() .. '").packages.' .. a.system .. '.minimal.options'
      }
    }
  }
end
