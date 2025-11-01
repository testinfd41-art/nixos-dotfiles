{ config, lib, pkgs, ... }:

{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;

    settings = {
      glx-use-copysubbuffer-mesa = true;
      xrender-sync = true;
      xrender-sync-fence = true;

      inactive-opacity = 1.5;
      active-opacity = 1.5;
      inactive-dim = 0.0;
      opacity-rule = [
        "100:class_g = 'firefox'"
      ];
    };
  };
}
