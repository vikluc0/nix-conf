{ config, lib, pkgs, ...}:

{
  xdg.autostart = {
    enable = lib.mkDefault true;

    entries = [
      (pkgs.writeText "localsend.desktop" ''
        [Desktop Entry]
        Type=Application
        Name=LocalSend
        Exec=${lib.getExe pkgs.localsend}
        Terminal=false
      '')

      (pkgs.writeText "openrgb.desktop" ''
        [Desktop Entry]
        Type=Application
        Name=OpenRGB
        Exec=${lib.getExe pkgs.openrgb}
        Terminal=false
      '')
    ];
  };
}
