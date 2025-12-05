{ config, pkgs, ... }:

{
  home = {
    homeDirectory = "/Users/severyn-matsiak";
    username = "severyn-matsiak";
    stateVersion = "26.05";
  };

  # Install Ghostty.
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    # Specify darwin package.
    package = pkgs.ghostty-bin;

    settings = {
      background-opacity = 0.95;
      # background-blur = true;
      cursor-style = "block";
      focus-follows-mouse = true;
      font-family = "Roboto Mono";
      font-size = 10;
      #initial-command = "neofetch";
      mouse-scroll-multiplier = 6;
      shell-integration = "detect";
      shell-integration-features = "no-cursor";
      term = "xterm-256color";
      #theme = "Apple System Colors";
      #theme = "Espresso";
      #theme = "elementary-os";
      window-decoration = "auto";
      window-padding-x = 6;
      # this is currently only supported on macOS :(
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

  # Install VSCode.
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        redhat.vscode-yaml
      ];

      userSettings = {
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "security.workspace.trust.untrustedFiles" = "open";
        "terminal.integrated.fontFamily" = "Roboto Mono";
        "update.mode" = "manual";
      };
    };
  };
}
