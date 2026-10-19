{pkgs, pkgs-unstable, nixos-splash-plasma6, ... }:

let
  wallpaperName = "ddg_1774716902087709339.jpg";
  wallpaperFile = ../sddm_background + "/${wallpaperName}";

  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";  
    themeConfig = {
      HeaderTextColor = "#FF0000";
      Background = "Backgrounds/${wallpaperName}";
    };
  }).overrideAttrs (oldAttrs: {
    installPhase = oldAttrs.installPhase + ''
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      cp ${wallpaperFile} $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/${wallpaperName}
    '';
  });
in

{

 nixpkgs.config.allowUnfree = true;

  programs = {
    firefox.enable = true;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
    zsh.enable = true;
    yazi.enable = true;
    localsend.enable = true;
  };
  
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    neovim
    wget
    kitty
    bat
    eza
    zoxide
    fastfetch
    fzf
    mangohud
    motrix
    vlc
    yt-dlp
    peazip
    whatsie
    libreoffice
    tailscale
    gparted
    ripgrep
    discord
    wl-clipboard
    nh
    openjdk
    jdk25
    prismlauncher
    sddm-astronaut
    kdePackages.qtmultimedia
    kdePackages.sddm-kcm
    hplip
    nixos-splash-plasma6.packages.${pkgs.stdenv.hostPlatform.system}.default
    waydroid
    wineWow64Packages.stable
    winetricks
    kdePackages.kdenlive
    ckan
    openrgb
    obs-studio
    btop
    git
  ] ++ (with pkgs-unstable; [
    croc  
  ]);

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    meslo-lgs-nf
  ]; 
  
}
