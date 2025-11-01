{ config, lib, pkgs, ... }:

{
  imports = [
    ./apps/firefox.nix
    ./apps/spotify.nix
    ./apps/picom.nix
    ./apps/cava.nix
    ./apps/dunst.nix
  ];
}
