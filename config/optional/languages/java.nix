{
  plugins = {
    jdtls = {
      enable = true;

      settings = {
        settings.java = {
          signatureHelp.enabled = true;
        };

        cmd = [
          "jdtls"
          {
            __raw = "'-data=' .. vim.fn.stdpath 'cache' .. '/jdtls/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')";
          }
        ];
      };
    };
  };
}
