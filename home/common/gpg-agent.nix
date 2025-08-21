{pkgs, ...}: {
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 30 * 24 * 60 * 60; # 30 days
    defaultCacheTtlSsh = 30 * 24 * 60 * 60; # 30 days
    sshKeys = ["DBB64E60684B1FF08B52E085B292DDE55E020F25"];
    pinentry.package = pkgs.pinentry-gtk2;
  };
}
