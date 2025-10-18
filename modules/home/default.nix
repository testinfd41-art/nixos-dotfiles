{ config, lib, pkgs, ... }:

{
  imports = [
    ./apps/firefox.nix
    ./apps/spotify.nix
  ];
}
