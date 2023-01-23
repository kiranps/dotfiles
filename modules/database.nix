{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_11;
    dataDir = "/opt/nix-module/data/postgresql";
  };
}
