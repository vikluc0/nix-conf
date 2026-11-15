{...}: {
  imports = [
    ./cli.nix
    ./settings.nix
    ./keybinds.nix
  ];

  programs.nvf.enable = true;
}
