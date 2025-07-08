{
  imports = [
    ./mappings.nix
    ./ui.nix
    ./plugins.nix
    ./desktop.nix
  ];

  opts = {
    relativenumber = true;
    conceallevel = 2;
    concealcursor = "nc";
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
}
