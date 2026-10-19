{ config, pkgs,... }:

{
  
  imports = [
    ./plasma-short.nix
    ./plasma-looks.nix
    ./plasma-effects.nix
    ./plasma-apps.nix
    ./plasma-settings.nix
  ];

  programs.plasma = {
    enable = true;
  };
}
