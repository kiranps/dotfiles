{
  description = "gogcli - Google Workspace CLI (gog)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    version = "0.16.0";
  in {
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      pname = "gogcli";
      inherit version;

      src = pkgs.fetchurl {
        url = "https://github.com/openclaw/gogcli/releases/download/v${version}/gogcli_${version}_linux_amd64.tar.gz";
        hash = "sha256-Rsj/pxpOQl5ohbkm8cZ754mfREyeJUro2pxG6il6a9o=";
      };

      sourceRoot = ".";

      dontConfigure = true;
      dontBuild = true;

      installPhase = ''
        install -Dm755 gog $out/bin/gog
      '';

      meta = {
        description = "Google Workspace CLI tool";
        homepage = "https://github.com/openclaw/gogcli";
        mainProgram = "gog";
      };
    };
  };
}
