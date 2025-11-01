{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dope-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  services.displayManager.ly.enable = true;

  boot.kernelParams = [
    "snd_sof.force_probe=1"
    "snd_sof.acp_power_gating=0"
    "snd_hda_intel.power_save=0"
    "snd_hda_intel.dmic_detect=0"
    "snd_hda_intel.probe_mask=1"
    "snd_hda_intel.enable_msi=0"
  ];

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs {
      src = ./config/dwm;
    };
  };
  nixpkgs.config.allowUnfree = true;

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_ON_AC = "on";

      USB_AUTOSUSPEND = 1;
      USB_BLACKLIST_BTUSB = 1; # if you use Bluetooth, blacklist it to avoid disconnects

      DISK_IDLE_SECS_ON_BAT = 2;
      SATA_LINKPWR_ON_BAT = "min_power";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
      CPU_BOOST_ON_BAT = 0;
    };
  };

  users.users.krish = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.gvfs.enable = true;

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    mpv
    git
    xclip
    flameshot
    brightnessctl
    pcmanfm
    libnotify
    blueman
    nitrogen
    feh
    papirus-icon-theme
    btop
    alsa-utils
    htop
    xfce.tumbler
    ffmpegthumbnailer
    fastfetch
    pavucontrol
    libva-utils
  ];

  services.tumbler.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}

