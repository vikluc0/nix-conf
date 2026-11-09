{ config, lib, pkgs, ...}:

{
  xdg.autostart = {
    enable = lib.mkDefault true;

    entries = [
      
    ];
  };
}
