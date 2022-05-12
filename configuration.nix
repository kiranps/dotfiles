{ config, pkgs, ... }:

{
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    system = aarch64-darwin
    experimental-features = nix-command flakes
    keep-derivations = true
    keep-outputs = true
  '';

  services.nix-daemon.enable = true;
}
