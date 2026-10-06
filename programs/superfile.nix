{ config, lib, ... }:

{
  programs.superfile = {
    enable = true;

    settings = {
      auto_check_update = false;
      editor = "micro";
      ignore_missing_fields = true;
      theme = "tokyonight";
    };
  };

  home.shellAliases = lib.mkIf config.programs.superfile.enable {
    spf = "superfile";
  };
}
