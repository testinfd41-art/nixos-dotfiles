{ config, lib, pkgs, ... }: {

programs.git = {
    enable = true;
    userName = "testinfd41-art";
    userEmail = "testinfd41@gmail.com";
    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
} 
