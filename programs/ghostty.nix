{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    # Specify darwin package.
    package = pkgs.ghostty-bin;

    settings = {
      auto-update = "off";
      background-opacity = 0.9;
      background-blur = true;
      cursor-style = "block";
      focus-follows-mouse = true;
      font-family = "Roboto Mono";
      font-size = 14;
      font-style = "Regular";
      mouse-scroll-multiplier = 4;
      shell-integration = "detect";
      shell-integration-features = "no-cursor";
      term = "xterm-256color";
      #theme = "dark:Apple System Colors,light:Apple System Colors Light";
      #theme = "Batman";
      #theme = "Cyberdyne";
      #theme = "Cyberpunk";
      #theme = "Cyberpunk Scarlet Protocol";
      #theme = "ENCOM";
      #theme = "elementary-os";
      #theme = "Scarlet Protocol";
      #theme = "Sea Shells";
      #theme = "Spacedust";
      #theme = "Spiderman";
      #theme = "Synthwave";
      #theme = "Synthwave Alpha";
      #theme = "Synthwave Everything";
      theme = "dark:TokyoNight,light:TokyoNight Day";
      window-decoration = "auto";
      window-padding-x = 6;
      window-save-state = "always";
    };

    themes = {
      elementary-os = {
        background = "#2E2E2E";
        foreground = "#93A1A1";
        cursor-color = "#839496";
        selection-background = "#93A1A1";
        selection-foreground = "#2E2E2E";
        palette = [
          "0=#073642"
          "1=#DC322F"
          "2=#859900"
          "3=#B58900"
          "4=#268BD2"
          "5=#D33682"
          "6=#2AA198"
          "7=#EEE8D5"
          "8=#605B65"
          "9=#DC322F"
          "10=#586E75"
          "11=#657B83"
          "12=#839496"
          "13=#6C71C4"
          "14=#93A1A1"
          "15=#FDF6E3"
        ];
      };
    };
  };
}
