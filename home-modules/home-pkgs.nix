{
  pkgs,
  serpantinum,
  ...
}: {
  imports = [
    serpantinum.homeManagerModules.default
    ./nvim/nvim.nix
    ./zsh.nix
  ];

  programs = {
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

  home.packages = with pkgs; [
    kdePackages.kate
    kdePackages.spectacle
    kdePackages.gwenview
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk
  ];
}
