{
  pkgs,
  nixos-splash-plasma6,
  ...
}: let
  sddmWallpaperName = "mountain.png";
  sddmWallpaperFile = ../wallpapers + "/${sddmWallpaperName}";

  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "astronaut";
      themeConfig = {
        HeaderTextColor = "#FF0000";
        Background = "Backgrounds/${sddmWallpaperName}";
      };
    }).overrideAttrs (oldAttrs: {
      installPhase =
        oldAttrs.installPhase
        + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${sddmWallpaperFile} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/${sddmWallpaperName}
        '';
    });
in {
  nixpkgs.config.allowUnfree = true;

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    tailscale
    gparted
    nh
    sddm-astronaut
    hplip
    nixos-splash-plasma6.packages.${pkgs.stdenv.hostPlatform.system}.default
    gnome-keyring
    waydroid
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk
    kdePackages.qtmultimedia
    kdePackages.sddm-kcm
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    meslo-lgs-nf
  ];
}
