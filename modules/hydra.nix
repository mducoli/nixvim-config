{ self, ... }:
{
  flake.hydraJobs = {
    pkgs = self.packages;
  };
}
