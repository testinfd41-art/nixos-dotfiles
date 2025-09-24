{ config, pkgs, ... }:

{
  imports = [
    ./modules/suckless.nix
  ];

  home.username = "krish";
  home.homeDirectory = "/home/krish";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.bash = { 
    enable = true;
    shellAliases = {
      btw = "echo i use nixos,btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw";
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
 ];
}
