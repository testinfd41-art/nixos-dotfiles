{ config, pkgs, ... }:

{
  imports = [
    ./modules/suckless.nix
    ./modules/home
    ./modules/home/apps/dunst.nix	
    ./modules/home/apps/cava.nix	
    ./modules/home/apps/torrent.nix
    ./modules/home/apps/firefox.nix
    ./modules/home/apps/git.nix

  ];

  home.username = "krish";
  home.homeDirectory = "/home/krish";
  home.stateVersion = "25.05";
  programs.bash = { 
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#dope-nixos";
    };
    initExtra = ''
      	  export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
      	'';
  };

  home.file.".config/dwm".source = ./config/dwm;
  home.file.".config/nvim".source = ./config/nvim;
  
  home.packages = with pkgs; [
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
];
}
