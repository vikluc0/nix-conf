{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/pkgs.nix
      ./modules/boot.nix
      ./modules/nvidia.nix
      ./modules/services.nix
      ./modules/nix.nix
      ./modules/system.nix
      ./modules/desktop.nix
      ./modules/users.nix
      ./modules/env.nix
      ./modules/virt.nix
    ];

  system.stateVersion = "26.05"; 

}

