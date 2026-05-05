{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name  = "Severyn Matsiak";
        email = "severyn.matsiak@gmail.com";
      };

      push = { autoSetupRemote = true; };
    };
  };
}
