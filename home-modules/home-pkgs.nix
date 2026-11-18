{
  pkgs,
  pkgs-unstable,
  serpantinum,
  bedrock-on-linux,
  ...
}: {
  imports = [
    serpantinum.homeManagerModules.default
    ./nvim/nvim.nix
    ./zsh.nix
  ];

  programs = {
    firefox.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    serpantinum = {
      enable = true;
      systemd.enable = false;
    };
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
        user = {
          name = "vikluc0";
          email = "viklucdaal@gmail.com";
        };
      };
    };

    ## how to push changes
    ## git add .
    ## git commit -m "change"
    ## git push origin main
  };

  home.packages = with pkgs;
    [
      neovim
      wget
      kitty
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

      kdePackages.okular
      kdePackages.spectacle
      kdePackages.gwenview
      kdePackages.kdenlive
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
}
