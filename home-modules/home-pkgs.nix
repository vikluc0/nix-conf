{ pkgs, pkgs-unstable, lazyvim, serpantinum, ... }:

{
  imports = [ 
    lazyvim.homeManagerModules.default
    serpantinum.homeManagerModules.default  
  ];

  programs = {
    fzf.enable = true;
    zoxide.enable = true;
    lazyvim = {
      enable = true;
      extraPackages = with pkgs; [
        lua5_1
        luarocks
      ];
    };
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

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
 
      history = {
        size = 5000;
        save = 5000;
        ignoreDups = true;
        share = true;
      };
 
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/#VirusPC";
        update = "sudo nix flake update --flake /etc/nixos/ && sudo nixos-rebuild switch --flake /etc/nixos/#VirusPC && flatpak update";
        bios-update = "sudo fwupdmgr refresh && sudo fwupdmgr update";
        nix-clean = "nh clean all --keep 5";
        ls = "ls --color=auto";
        eza = "eza --color=auto -a --icons=always --group-directories-first";
        ezal = "eza --color=auto -lah --icons=always --git";
        ezat = "eza --color=auto --tree --level=2 --icons=always";
        btop = "LD_LIBRARY_PATH=/run/opengl-driver/lib btop";
      };
 
      initContent = ''
 
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
 
        if command -v fastfetch &>/dev/null; then
            if [[ -f "$HOME/.config/fastfetch/min.jsonc" ]]; then
                fastfetch -c "$HOME/.config/fastfetch/min.jsonc"
            else
                fastfetch
            fi
        fi
 
        [[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh
 
      # Yazi function wrapper cleanly isolated from Nix interpolation variables
        y() {
            local tmp
            tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
            command yazi "$@" --cwd-file="$tmp"
            if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                builtin cd -- "$cwd"
            fi
            command rm -f -- "$tmp"
        }
      '';
 
      oh-my-zsh = {
        enable = true;
        #theme = "powerlevel10k/powerlevel10k";
        plugins = [ "git" ];
      };
    };

  };
  
  home.packages = with pkgs; [
    kdePackages.kate
    kdePackages.spectacle
    kdePackages.gwenview
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk
  ] ++ (with pkgs-unstable; [
    
  ]);
}
