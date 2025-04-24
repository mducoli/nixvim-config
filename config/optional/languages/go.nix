{
  plugins = {
    lsp.servers = {
      gopls.enable = true;
      templ.enable = true;
    };
  };

  extraConfigLua = ''
    local null_ls = require("null-ls")

    -- Go Templ formatter
    local templ_formatter = {
      name = "templ_fmt",
      method = null_ls.methods.FORMATTING,
      filetypes = { "templ" },
      generator = null_ls.formatter({
        command = "templ",
        args = { "fmt" },
        to_stdin = true,
      }),
    }
    null_ls.register(templ_formatter)
  '';
}
