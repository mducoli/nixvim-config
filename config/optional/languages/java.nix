{
  plugins = {
    nvim-jdtls = {
      enable = true;

      settings.settings.java = {
        signatureHelp.enabled = true;
      };

      data.__raw = "vim.fn.stdpath 'cache' .. '/jdtls/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')";
    };
  };
}
