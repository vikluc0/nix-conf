{serpantinum, ...}: {
  imports = [
    serpantinum.homeManagerModules.default
    ./kitty.nix
    ./zsh.nix
    ./nvim/nvim.nix
    ./btop.nix
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
}
