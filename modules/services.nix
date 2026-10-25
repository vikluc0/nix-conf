{ pkgs, ... }:

{
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      Genaral = {
        Discoverable = true;
        Pairable = true;
      };
    };
  };

  services = { 
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      xkb = {
        layout = "us";
	      variant = "";
      };
    };

    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        extraPackages = with pkgs; [
          sddm-astronaut
        	kdePackages.qtmultimedia
        	kdePackages.qtsvg
        	kdePackages.ksvg
        ];
        theme = "sddm-astronaut-theme";
        settings = {
          X11= {
            XkbLayout = "us";
  	      };
        };
      };
    };

    gvfs.enable = true;
    udisks2.enable = true;  
    printing = {
      enable = true;
      drivers = [ pkgs.hplip ]; 
    };
    blueman.enable = true;

##    restic.backups.nixos-config = {
##     initialize = true;
##     repository = "/backup/nixos-config-repo"; 
##     paths = [ "/etc/nixos" ]; 
##     timerConfig = {
##       OnCalendar = "daily";
##       Persistent = true;
##     };
##    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      alsa.support32Bit = true; 
      jack.enable = true;
    };
    flatpak = { 
      enable = true;
      remotes = [ 
        {
          name = "flathub";
	  location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      uninstallUnmanaged = true; 
    };
    openssh = { 
      enable = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
      };
    };
    hardware.openrgb.enable = true;
    tailscale.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 
         
      ];
      allowedUDPPorts = [ 
         
      ];
    };
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    pam.services.gnome-keyring.enable = true ;
  };

}
