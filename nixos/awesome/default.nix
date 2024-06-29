{ pkgs, ... }: {
  #home.file = {
    #".config/awesome".source =
      #config.lib.file.mkOutOfStoreSymlink ".dotfiles/nixos/awesome/config";
  #};
}
