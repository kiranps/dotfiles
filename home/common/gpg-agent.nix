{ pkgs, ... }: {
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 2592000;
    defaultCacheTtlSsh = 2592000;
    maxCacheTtl = 2592000;
    sshKeys = [ "DBB64E60684B1FF08B52E085B292DDE55E020F25" ];
  };
}
