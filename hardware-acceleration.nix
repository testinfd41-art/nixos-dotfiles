{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      libva
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
