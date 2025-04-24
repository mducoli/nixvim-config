{
  plugins = {
    lsp.servers = {
      terraformls.enable = true;
    };
  };

  extraConfigLua = ''
    local null_ls = require("null-ls")

    -- OpenTofu formatter
    local tofu_formatter = {
      name = "tofu_fmt",
      method = null_ls.methods.FORMATTING,
      filetypes = { "terraform", "tf", "terraform-vars" },
      generator = null_ls.formatter({
        command = "tofu",
        args = { "fmt", "-" },
        to_stdin = true,
      }),
    }
    null_ls.register(tofu_formatter)
  '';
}
