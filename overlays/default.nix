{inputs, ...}: {
  modifications = final: prev: {
    nil = final.rustPlatform.buildRustPackage rec {
      pname = "nil";
      version = "577d160da311cc7f5042038456a0713e9863d09e";

      src = final.fetchFromGitHub {
        owner = "oxalica";
        repo = "nil";
        rev = version;
        hash = "sha256-ggXU3RHv6NgWw+vc+HO4/9n0GPufhTIUjVuLci8Za8c=";
      };

      useFetchCargoVendor = true;
      cargoHash = "sha256-uZsLlFU9GKLvFllF7Kf5Q7HfN26KQojf4rvOb9p7Rjs=";

      nativeBuildInputs = [
        (final.lib.getBin final.nixVersions.latest)
      ];

      env.CFG_RELEASE = version;

      preBuild = ''
        export NIX_STATE_DIR=$(mktemp -d)
      '';

      meta = with final.lib; {
        description = "Yet another language server for Nix";
        homepage = "https://github.com/oxalica/nil";
        changelog = "https://github.com/oxalica/nil/releases/tag/${version}";
        license = with licenses; [
          mit
          asl20
        ];
        maintainers = with maintainers; [
          figsoda
          oxalica
        ];
        mainProgram = "nil";
      };
    };
  };
}
