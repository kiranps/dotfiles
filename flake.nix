{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    unikraft-cli.url = "path:./pkgs/unikraft-cli";
    unikraft-cli.inputs.nixpkgs.follows = "nixpkgs";
    gogcli.url = "path:./pkgs/gogcli";
    gogcli.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    darwin,
    home-manager,
    unikraft-cli,
    gogcli,
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
        extraSpecialArgs = {
          # Generic attrset of all local packages from pkgs/.
          # Add new pkgs/ flakes as inputs above and list them here.
          localPkgs = {
            unikraft-cli = unikraft-cli.packages.${system}.default;
            gogcli = gogcli.packages.${system}.default;
          };
        };
        modules = [./home/kiran];
      };
      makhang = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/makhang];
      };
    };
  };
}
