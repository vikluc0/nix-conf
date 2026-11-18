{serpantinum, ...}: {
  imports = [
    serpantinum.homeManagerModules.default
    ./nvim/nvim.nix
    ./zsh.nix
  ];

  programs = {
    firefox.enable = true;
    kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11.0;
      };

      settings = {
        cursor_shape = "beam";
        cursor_trail = 1;
        window_margin_width = "21.75";
        remember_window_size = "no";
        confirm_os_window_close = 0;
        background_opacity = "0.6";
      };

      extraConfig = ''
        # Scroll & Zoom
        map page_up scroll_page_up
        map page_down scroll_page_down

        map ctrl+plus change_font_size all +1
        map ctrl+equal change_font_size all +1
        map ctrl+kp_add change_font_size all +1
        map ctrl+minus change_font_size all -1
        map ctrl+underscore change_font_size all -1
        map ctrl+kp_subtract change_font_size all -1
        map ctrl+0 change_font_size all 0
        map ctrl+kp_0 change_font_size all 0
      '';
    };
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
