{ pkgs, ... }:

{
  home.packages = with pkgs; [ skhd utm ];
}
