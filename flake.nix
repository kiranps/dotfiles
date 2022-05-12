{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager";
    neovim.url = "github:neovim/neovim?dir=contrib";
    nur.url = "github:nix-community/NUR";
    spacebar.url = "github:shaunsingh/spacebar";
    yabai-src = {
      url = "github:koekeishiya/yabai";
      flake = false;
    };

    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim.inputs.nixpkgs.follows = "nixpkgs";
    spacebar.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, darwin, home-manager, neovim, spacebar, ... }@inputs: {
    darwinConfigurations = {
      macbook_pro_m1 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          home-manager.darwinModules.home-manager
          ({ config, pkgs, lib, ... }: {
            nixpkgs.overlays = with inputs; [
              neovim.overlay
              nur.overlay
              spacebar.overlay
              (final: prev: {
                yabai = let
                  version = "4.0.0-dev";
                  buildSymlinks = prev.runCommand "build-symlinks" { } ''
                    mkdir -p $out/bin
                    ln -s /usr/bin/xcrun /usr/bin/xcodebuild /usr/bin/tiffutil /usr/bin/qlmanage $out/bin
                  '';
                in prev.yabai.overrideAttrs (old: {
                  inherit version;
                  src = inputs.yabai-src;

                  buildInputs = with prev.darwin.apple_sdk.frameworks; [
                    Carbon
                    Cocoa
                    ScriptingBridge
                    prev.xxd
                    SkyLight
                  ];

                  nativeBuildInputs = [ buildSymlinks ];
                });
              })
            ];
          })
          ./configuration.nix
          ./home.nix
          ./modules/yabai.nix
          ./modules/homebrew.nix
          ./modules/neovim.nix
        ];
      };
    };
  };
}
