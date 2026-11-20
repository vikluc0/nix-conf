{
  pkgs,
  pkgs-unstable,
  nixos-splash-plasma6,
  bedrock-on-linux,
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
  environment.systemPackages = with pkgs;
    [
      tailscale
      gparted
      nh
      sddm-astronaut
      hplip
      nixos-splash-plasma6.packages.${pkgs.stdenv.hostPlatform.system}.default
      gnome-keyring
      waydroid
      neovim
      wget
      bat
      eza
      fastfetch
      mangohud
      vlc
      yt-dlp
      peazip
      whatsie
      libreoffice
      localsend
      ripgrep
      discord
      wl-clipboard
      jdk25
      wineWow64Packages.stable
      winetricks
      ckan
      openrgb
      obs-studio
      btop
      quickshell
      spotify
      lavat
      ffmpeg
      plasticity
      notesnook
      chromium
      szyszka
      prismlauncher
      bedrock-on-linux.packages.${pkgs.stdenv.hostPlatform.system}.default
      thunderbird

      kdePackages.okular
      kdePackages.spectacle
      kdePackages.gwenview
      kdePackages.kdenlive
      kdePackages.breeze
      kdePackages.breeze-icons
      kdePackages.breeze-gtk
      kdePackages.qtmultimedia
      kdePackages.sddm-kcm
    ]
    ++ (with pkgs-unstable; [
      (superfile.overrideAttrs (oldAttrs: {
        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            mv $out/bin/superfile $out/bin/spf
          '';

        meta =
          oldAttrs.meta
          // {
            mainProgram = "spf";
          };
      }))
      (pkgs.symlinkJoin {
        name = "orca-slicer";
        paths = [pkgs-unstable.orca-slicer];
        buildInputs = [pkgs.makeWrapper];

        postBuild = ''
          wrapProgram $out/bin/orca-slicer \
            --set WEBKIT_DISABLE_DMABUF_RENDERER 1 \
            --set GDK_BACKEND x11 \
            --set GTK_THEME Adwaita:dark \
        '';
      })
      motrix
      croc
    ]);

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
    "org.gnome.Platform//51"
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    meslo-lgs-nf
  ];
}
