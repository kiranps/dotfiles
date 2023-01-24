{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    dataDir = "/opt/nix-module/data/postgresql";
  };
}
