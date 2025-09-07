{
  flake.modules.nixvim.core = {

    nixpkgs.overlays = [
      (_final: prev: {
        neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (old: {
          postInstall =
            old.postInstall or ""
            # sh
            + ''
              substituteInPlace $out/share/applications/nvim.desktop \
                --replace 'Exec=nvim "%F"' 'Exec=nvim %F'
            '';
        });
      })
    ];
  };
}
