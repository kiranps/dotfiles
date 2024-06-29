{ pkgs }:

pkgs.python3.withPackages (p: with p; [ black pip wcwidth spinners python-gitlab boto3 ])
