{lib, ...}: {
  xdg.autostart = {
    enable = lib.mkDefault true;

    entries = [
    ];
  };
}
