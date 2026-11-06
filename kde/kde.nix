{ config, pkgs,... }:

{
  
  imports = [
    ./plasma-short.nix
    ./plasma-looks.nix
    ./plasma-effects.nix
    ./plasma-apps.nix
    ./plasma-settings.nix
    ./plasma-autostart.nix
  ];

  programs.plasma = {
    enable = true;
  };
}
