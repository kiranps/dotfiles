{ config, lib, pkgs, pkgs-stable, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelPackages = pkgs-stable.linuxPackages_latest;
  boot.loader.timeout = 10; 

  networking.hostName = "nixos"; # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

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
    #xkb.layout = "us";
    #xkb.variant = "";
    #layout = "us";
    #variant = "";
    #displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [ luarocks luadbi-mysql ];
    };
  };

  #services.greetd.enable = true;
  services.displayManager.ly.enable = lib.mkDefault true;
  services.displayManager.ly.settings = {
    load = true;
    save = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kiran = {
    isNormalUser = true;
    description = "kiran";
    extraGroups = [ "networkmanager" "wheel" ];
    #shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [ bluez xorg.xwininfo ];
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "22.11";

  services.xserver.videoDrivers = [ "intel" ];

  #programs.steam = {
    #enable = true;
    #remotePlay.openFirewall = true;
    #dedicatedServer.openFirewall = true;
    #localNetworkGameTransfers.openFirewall = true;
  #};
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
