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
  boot.kernelPackages = pkgs.linuxPackages_6_12;

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
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      # for android-studio
      zlib
      glib
      libxext
      libx11
      libxi
      libxtst
      libxrandr
      libxcursor
      libxfixes
      freetype
      fontconfig
      libGL
      gtk3
      libpulseaudio
      alsa-lib
      libcxx
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53317 6007 9091 9300 39087 8081 5037 5555 8080 8081];
    allowedUDPPorts = [53317 6007 9300 39087 8081 5037 5555 8080];
    allowedTCPPortRanges = [
      {
        from = 5000;
        to = 9000;
      }
    ];
  };

  #8081 - Metro Bundler

  virtualisation.containers.enable = true;
  virtualisation.docker.enable = true;
  #virtualisation.podman = {
  #enable = true;
  #dockerCompat = true; # enables `docker` alias for podman
  #defaultNetwork.settings.dns_enabled = true; # optional but useful
  #};
  zramSwap = {
    enable = true;
    memoryPercent = 80;
  };

  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      global = {
        security = "user";
        "map to guest" = "bad user";
      };
      guest_share = {
        path = "/home/makhang/Downloads/";
        browseable = true;
        "public" = true;
        "guest ok" = true;
        "printable" = false;
        "force user" = "kiran";
        "force group" = "users";
      };
    };
  };

  system.stateVersion = "25.05";
}
