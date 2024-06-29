{ pkgs, ... }:

{
  home.packages = with pkgs; [ firefox starship xclip xsel ];
}
