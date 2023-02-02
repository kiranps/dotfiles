{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils-plus.url = "github:gytis-ivaskevicius/flake-utils-plus";
    flake-utils-plus.inputs.flake-utils.follows = "flake-utils";
  };

  #outputs = { nixpkgs, darwin, home-manager, ... }@inputs: {
  #darwinConfigurations = {
  #macbook_pro_m1 = darwin.lib.darwinSystem {
  #system = "aarch64-darwin";
  #modules = [
  #home-manager.darwinModules.home-manager
  #./configuration.nix
  #./home.nix
  #./modules/yabai.nix
  #./modules/homebrew.nix
  #./modules/neovim.nix
  #./modules/database.nix
  #./modules/sketchybar
  #];
  #};
  #};
  #};

  outputs = inputs@{ self, flake-utils-plus, nixpkgs, darwin, ... }:
    let
      inherit (flake-utils-plus.lib)
        mkFlake exportModules exportPackages exportOverlays;
    in mkFlake {
      inherit self inputs;

      channelsConfig = { allowUnfree = true; };


      modules = exportModules [
        ./modules/home.nix
        ./modules/homebrew.nix
      ];

      hostDefaults = {
        specialArgs = { inherit inputs; };
      };

      hosts.macbook_pro_m1 = {
        system = "aarch64-darwin";
        modules = [
          self.modules.home
          self.modules.homebrew
          #./modules/yabai.nix
          #./modules/home.nix
          #./modules/homebrew.nix
          #./modules/database.nix
        ];
        output = "darwinConfigurations";
        builder = darwin.lib.darwinSystem;
      };
    };
}
