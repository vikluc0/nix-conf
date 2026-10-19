{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true; 
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot"; 
      };
    };
    kernelPackages = pkgs.linuxPackages;
    initrd.kernelModules = [
      "nvidia" 
      "nvidia_modeset" 
      "nvidia_uvm" 
      "nvidia_drm" 
    ];
    kernelParams = [ "nvidia-drm.fbdev=1" ];
  };
}
