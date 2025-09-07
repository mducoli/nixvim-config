{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";

      programs = {
        deadnix.enable = true;
        statix.enable = true;
        keep-sorted.enable = true;
        nixfmt = {
          enable = true;
          strict = true;
        };
      };

      settings.formatter = {
        deadnix.priority = 1;
        statix.priority = 2;
        nixfmt.priority = 3;
      };

      settings.excludes = [ "flake.lock" ];
    };

    # pre-commit.settings.hooks.treefmt.enable = true;
  };
}
