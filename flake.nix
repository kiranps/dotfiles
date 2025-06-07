{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixpkgs-stable, darwin, home-manager, ... }@inputs: {
    darwinConfigurations = {
      macbook_pro_m1 = darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        system = "aarch64-darwin";
        modules = [ ./darwin home-manager.darwinModules.home-manager ./common ];
      };
    };

    nixosConfigurations = {
      thinkpad_e480 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [ ./nixos home-manager.nixosModules.home-manager ];
      };
    };
  };
}
