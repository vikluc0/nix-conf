{ pkgs, ... }:

{
  users.users.vikluc0 = {
    isNormalUser = true;
    description = "vikluc0";
    shell = pkgs.zsh;
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "dialout"
    ]; 
    packages = with pkgs; [
       
    ];
  };
}
