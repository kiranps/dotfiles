{ pkgs, ... }: {
  services.gpg-agent = {
    enable = true;
    sshKeys = [ "DBB64E60684B1FF08B52E085B292DDE55E020F25" ];
  };
}
