{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  #boot.kernelPackages = pkgs-stable.linuxPackages_latest;
  boot.kernelPackages = pkgs-stable.linuxPackages_6_12;

  boot.loader.timeout = 10;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  networking.hostName = "gamebox";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8"; # safer than en_IN
  i18n.extraLocales = ["en_US.UTF-8/UTF-8"];
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  users.users.makhang = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "adbusers" "docker" "video" "i2c"];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [stdenv.cc.cc.lib];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 5000;
        to = 5100;
      }
    ];
  };

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # enables `docker` alias for podman
    defaultNetwork.settings.dns_enabled = true; # optional but useful
  };
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  system.stateVersion = "25.05";
}
