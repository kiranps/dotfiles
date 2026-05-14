{
  description = "unikraft cli";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    # nixpkgs bootstrap chain tops out at Go 1.22, so we cannot compile
    # Go 1.26 from source via overrideAttrs. Use the official prebuilt binary.
    go_1_26 = pkgs.go.overrideAttrs (old: {
      pname = "go";
      version = "1.26.3";

      src = pkgs.fetchurl {
        url = "https://go.dev/dl/go1.26.3.linux-amd64.tar.gz";
        sha256 = "sha256-Kyz8cUhJPaXnOYG/+/M1OvOB1fk+eJyCx5r/ZJYutVY=";
      };

      # Prebuilt — skip all build phases and patches.
      patches = [];
      nativeBuildInputs = [];
      buildInputs = [];
      dontConfigure = true;
      dontBuild = true;
      doCheck = false;

      installPhase = ''
        mkdir -p $out
        cp -r . $out/
      '';
    });
  in {
    packages.${system}.default = pkgs.buildGoModule.override { go = go_1_26; } {
      pname = "unikraft-cli";
      version = "latest";

      src = pkgs.fetchFromGitHub {
        owner = "unikraft";
        repo = "cli";
        rev = "6df31d90b54154300ea4637baaa2f2cabe932326";
        sha256 = "sha256-Mc8ORVdibg4Dgj1jc2FDs2XPpP7eYasHcYPuJJDP4YU=";
      };

      vendorHash = "sha256-n8Z7oG6AS3IjoFnOmuRPEmPc/oNjA+BgmYVmkoytBmE=";
    };
  };
}
