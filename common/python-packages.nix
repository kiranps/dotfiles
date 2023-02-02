{ pkgs }:

pkgs.python3.withPackages (p: with p; [ black pip])
