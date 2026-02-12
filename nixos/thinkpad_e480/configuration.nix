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
  boot.kernelPackages = pkgs-stable.linuxPackages_latest;
  boot.loader.timeout = 3;

  # Optimize kernel boot options
  boot.kernelParams = [
    "quiet"
    "splash"
  ];

  networking.hostName = "nixos";

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
  #services.xserver = {
  #enable = true;
  #videoDrivers = ["intel"];
  #};

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --cmd sway";
        user = "kiran"; # greetd runs greeters as this user
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
    jack.enable = true;
  };

  security.polkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kiran = {
    isNormalUser = true;
    description = "kiran";
    extraGroups = ["networkmanager" "wheel" "adbusers" "docker" "video" "i2c"];
    #shell = pkgs.zsh;
  };
  programs.light.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [stdenv.cc.cc.lib glib nspr nss dbus atk cups cairo gtk3 pango xorg.libX11 xorg.libXcomposite xorg.libXcursor xorg.libXcursor xorg.libXdamage xorg.libXext xorg.libXfixes xorg.libXi xorg.libXrender xorg.libXtst xorg.libXrandr mesa];
  };
  #programs.adb.enable = true;
  programs.zsh.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  system.stateVersion = "22.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  systemd.services.NetworkManager-wait-online.enable = false;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53317 6007 9091 9300 39087 8081 5037 5555 8080];
    allowedUDPPorts = [53317 6007 9300 39087 8081 5037 5555 8080];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
      {
        from = 5000;
        to = 5100;
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
