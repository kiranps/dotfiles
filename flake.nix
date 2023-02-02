{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, darwin, home-manager, ... }@inputs: {
    darwinConfigurations = {
      macbook_pro_m1 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          home-manager.darwinModules.home-manager
          ./modules/configuration.nix
          ./modules/home.nix
          ./modules/yabai.nix
          ./modules/skhd.nix
          ./modules/homebrew.nix
          ./modules/neovim.nix
          ./modules/database.nix
          #./modules/sketchybar
        ];
      };
    };
  };
}
