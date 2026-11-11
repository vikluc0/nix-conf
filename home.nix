{config, lib, pkgs, ... }:


{
  imports = [
    ./kde/kde.nix
    ./home-modules/home-pkgs.nix
  ];
  home.username = "vikluc0";
  home.homeDirectory = "/home/vikluc0";
  home.stateVersion ="26.05";

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Breeze-Dark";
    };
  };

  xdg.configFile ={  
    "kitty".source = ./dotfiles/kitty;
    "p10k.zsh".source = ./dotfiles/.p10k.zsh;
    "fastfetch".source = ./dotfiles/fastfetch;
    "hypr".source = ./dotfiles/hypr;
    "superfile".source = ./dotfiles/superfile;
    "btop".source = ./dotfiles/btop;
  };

  home.activation.removeOldHmBackups =
    lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f "$HOME/.gtkrc-2.0.hm-backup"
  '';
  
}
