{ config, lib, pkgs, ... }:

{
  options.bootOptimization.enable = lib.mkEnableOption "Enable boot optimizations";

  config = lib.mkIf config.bootOptimization.enable {
    # Disable unnecessary services
    services = {
      printing.enable = false;
    };
    systemd.services."ModemManager".enable = false;

    # Optimize systemd startup
    systemd.extraConfig = ''
      DefaultTimeoutStartSec=5s
      DefaultTimeoutStopSec=5s
      DefaultDependencies=no
    '';

    # Optimize kernel boot options
    boot.kernelParams = [
      "quiet"
      "splash"
      "init_on_alloc=0"
      "init_on_free=0"
      "noautogroup"
      "zswap.enabled=1"
      "zswap.compressor=zstd"
      "zswap.max_pool_percent=20"
    ];

    # Optimize initramfs
    boot.initrd.kernelModules = [ "lz4" ];
    boot.initrd.systemd.enable = true;

    # Optimize filesystem
    fileSystems."/" = {
      options = [ "noatime" "discard=async" ];
    };

    # Enable SSD TRIM (for SSDs)
    services.fstrim.enable = true;

    # Optimize bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 1;

    # Use lightweight display manager
    services.displayManager.ly.enable = true;
    services.xserver.enable = true;
  };
}
