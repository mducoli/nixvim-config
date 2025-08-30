{ pkgs, lib, ... }:
let

  typst-languagetool = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
    pname = "typst-languagetool";
    version = "a54641fef5d197a860c9adef10c474a7555685d2";

    src = pkgs.fetchFromGitHub {
      owner = "antonWetzel";
      repo = "typst-languagetool";
      rev = "a54641fef5d197a860c9adef10c474a7555685d2";
      hash = "sha256-AkXOiqdL8VGjZF4NElrXkMhpId2TktNgO61YklY5dDo=";
    };

    cargoHash = "sha256-h4i195BOR5zLbxsTRABwRBl6a5wnOZ9BYFnzOCcJEdI=";

    buildFeatures = [
      "jar"
    ];

    cargoBuildFlags = [
      "--package"
      "lsp"
    ];

    nativeBuildInputs = with pkgs; [
      makeBinaryWrapper
    ];

    OPENSSL_DIR =
      let
        openssl_wr = pkgs.symlinkJoin {
          name = "openssl-dev-out";
          paths = with pkgs; [
            openssl.dev
            openssl.out
          ];
        };
      in
      "${openssl_wr}";

    meta = {
      description = "LanguageTool Integration for Typst for spell and grammer check";
      homepage = "https://github.com/antonWetzel/typst-languagetool";
      license = lib.licenses.mit;
    };
  });

  typst-languagetool-wrapped = pkgs.writeShellApplication {
    name = "typst-languagetool-wrapped";
    runtimeInputs = [ pkgs.jre ];
    text = ''
      exec ${typst-languagetool}/bin/typst-languagetool-lsp "$@"
    '';
  };

in
{
  plugins = {
    lsp.servers.tinymist.enable = true;

    typst-preview.enable = true;

    conform-nvim.settings = {
      formatters_by_ft = {
        typst = [
          "typstyle"
        ];
      };

      formatters = {
        typstyle.command = lib.getExe pkgs.typstyle;
      };
    };
  };

  extraConfigLua = ''
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    if not configs.typst_lt then
      configs.typst_lt = {
        default_config = {
          cmd = { "${lib.getExe typst-languagetool-wrapped}" },
          root_dir = lspconfig.util.root_pattern(".git"),
          init_options = {
            backend = "jar",
            root = "",
            main = ".languagetool.typst",
            languages = { it = "it-IT", en = "en-US" },
            jar_location = "${pkgs.languagetool}/share/languagetool.jar",
          },
        },
      }
    end
    lspconfig.typst_lt.setup({})
  '';
}
