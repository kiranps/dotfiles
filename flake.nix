{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    darwin,
    nix-colors,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    darwinConfigurations = {
      macbook_pro_m1 = darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};
        system = "aarch64-darwin";
        modules = [./darwin home-manager.darwinModules.home-manager ./common];
      };
    };

    nixosConfigurations = {
      thinkpad_e480 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit pkgs-stable;
        };
        modules = [./nixos/thinkpad_e480];
      };

      ideapad_gaming = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit pkgs-stable;
        };
        modules = [./nixos/ideapad_gaming];
      };
    };

    homeConfigurations = {
      kiran = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit nix-colors;};
        modules = [./home/kiran];
      };
      makhang = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit nix-colors;};
        modules = [./home/makhang];
      };
    };
  };
}
