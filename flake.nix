{
  description = "Nixos flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
        url = "github:nix-community/home-manager/release-26.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixos-splash-plasma6 = {
      url = "github:nimrodium/nixos-splash-plasma6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim.url = "github:pfassina/lazyvim-nix";
    serpantinum.url = "github:ilyamiro/serpantinum";
  };
     
  outputs = { 
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    plasma-manager,
    lazyvim,
    nix-flatpak,
    nixos-splash-plasma6,
    serpantinum,
    ...
  }: {
    nixosConfigurations.VirusPC = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit nixos-splash-plasma6;
        inherit serpantinum;
        pkgs-unstable = import nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      modules = [
        ./configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        serpantinum.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.vikluc0 = {
              imports = [
	            ./home.nix
		          plasma-manager.homeModules.plasma-manager
	            ];
            };
            backupFileExtension = "hm-backup";
            extraSpecialArgs = { 
              inherit lazyvim;
	            inherit nixos-splash-plasma6;
    	          pkgs-unstable = import nixpkgs-unstable {
                system = "x86_64-linux";
                config.allowUnfree = true;
	            };
            };
          };
        }		
      ];
    };
  };	
}
