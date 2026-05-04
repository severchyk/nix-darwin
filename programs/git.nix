{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    config.user = {
      name  = "Severyn Matsiak";
      email = "severyn.matsiak@gmail.com";
    };

    settings = {
      push = { autoSetupRemote = true; };
    };
  };
}
