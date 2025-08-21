{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelPackages = pkgs-stable.linuxPackages_latest;
  boot.loader.timeout = 10;
  #boot.kernelParams = [ "video=HDMI1:2560x1080@60" "quiet" ];

  # Optimize kernel boot options
  boot.kernelParams = [
    "quiet"
    "splash"
    #"init_on_alloc=0"
    #"init_on_free=0"
    #"noautogroup"
    #"zswap.enabled=1"
    #"zswap.compressor=zstd"
    #"zswap.max_pool_percent=20"
  ];

  #systemd.extraConfig = ''
  #DefaultTimeoutStartSec=5s
  #DefaultTimeoutStopSec=5s
  #DefaultDependencies=no
  #'';

  # Optimize initramfs
  boot.initrd.kernelModules = ["lz4"];
  boot.initrd.systemd.enable = true;

  #fileSystems."/" = {
  #options = ["noatime" "discard=async"];
  #};

  networking.hostName = "nixos"; # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
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

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    videoDrivers = ["intel"];
    #windowManager.awesome = {
    #enable = true;
    #luaModules = with pkgs.luaPackages; [luarocks luadbi-mysql];
    #};
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd sway";
        user = "kiran"; # greetd runs greeters as this user
      };
    };
  };

  #services.xserver.exportConfiguration = true;

  #services.displayManager.ly.enable = lib.mkDefault true;
  #services.displayManager.ly.settings = {
  #load = true;
  #save = true;
  #};

  #services.gnome.gnome-keyring.enable = true;
  #security.pam.services.login.enableGnomeKeyring = true;
  #security.pam.services.ly.enableGnomeKeyring = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  security.polkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kiran = {
    isNormalUser = true;
    description = "kiran";
    extraGroups = ["networkmanager" "wheel" "adbusers" "docker" "video"];
    #shell = pkgs.zsh;
  };
  programs.light.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [stdenv.cc.cc.lib];
  };
  programs.adb.enable = true;
  programs.zsh.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bluez
    xorg.xwininfo
    glibc_multi
    podman
    podman-compose
  ];
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "22.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  systemd.services.NetworkManager-wait-online.enable = false;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53317 1716 6007 9091];
    allowedUDPPorts = [53317 1716 1717 1764 6007];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # enables `docker` alias for podman
    defaultNetwork.settings.dns_enabled = true; # optional but useful
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
        path = "/home/kiran/Downloads/Movies/";
        browseable = true;
        "public" = true;
        "guest ok" = true;
        "printable" = false;
        "force user" = "kiran";
        "force group" = "users";
      };
    };
  };
}
