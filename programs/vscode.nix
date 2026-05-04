{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-marketplace; [
        github.github-vscode-theme
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        mightbesimon.emoji-icons
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "security.workspace.trust.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "window.autoDetectColorScheme" = true;
        "workbench.iconTheme" = "emoji-file-icons";
        "workbench.preferredDarkColorTheme" = "GitHub Dark Default";
        "workbench.preferredLightColorTheme" = "GitHub Light Default";
        "workbench.productIconTheme" = "emoji-product-icons-fun";
      };
    };

    profiles.Catppuccin = {
      extensions = with pkgs.vscode-marketplace; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "window.autoDetectColorScheme" = true;
        "workbench.iconTheme" = "catppuccin-macchiato";
        "workbench.preferredDarkColorTheme" = "Catppuccin Macchiato";
        "workbench.preferredLightColorTheme" = "Catppuccin Latte";

        ## Catppuccin recommended settings:
        # we try to make semantic highlighting look good
        "editor.semanticHighlighting.enabled" = true;
        # prevent VSCode from modifying the terminal colors
        "terminal.integrated.minimumContrastRatio" = 1;
        # make the window's titlebar use the workbench colors
        "window.titleBarStyle" = "custom";
      };
    };

    profiles.Cyberpunk = {
      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        max-ss.cyberpunk
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "window.autoDetectColorScheme" = true;
        # "workbench.preferredDarkColorTheme" = "Activate SCARLET protocol (beta)";
        "workbench.preferredDarkColorTheme" = "Activate UMBRA protocol";
        "workbench.preferredLightColorTheme" = "Cyberpunk";
      };
    };

    profiles."Cyberpunk 2077" = {
      extensions = with pkgs.vscode-marketplace; [
        carlos18mz.cyberpunk-2077-rebuild
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "workbench.colorTheme" = "Cyberpunk 2077 rebuild";
      };
    };

    profiles.Matrix = {
      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
        ustymukhman.matrix-theme
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "workbench.colorTheme" = "Matrix";
      };
    };

    profiles.Nostromo = {
      extensions = with pkgs.vscode-marketplace; [
        ericson-willians.uscss-nostromo-theme
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "workbench.colorTheme" = "Alien Terminal (Nostromo Amber)";
        # "workbench.colorTheme" = "Alien Terminal (Nostromo Green)";
        # "workbench.colorTheme" = "Alien Terminal (Sevastopol Link)";
      };
    };

    profiles.SynthWave = {
      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
        robbowen.synthwave-vscode
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "workbench.colorTheme" = "SynthWave '84";
      };
    };

    profiles."Tokyo Night" = {
      extensions = with pkgs.vscode-marketplace; [
        enkia.tokyo-night
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        openai.chatgpt
        redhat.vscode-yaml
      ];

      userSettings = {
        "editor.fontFamily" = "Roboto Mono";
        "editor.fontSize" = 14;
        "explorer.confirmDelete" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.fontSize" = 14;
        "window.autoDetectColorScheme" = true;
        "workbench.preferredDarkColorTheme" = "Tokyo Night";
        # "workbench.preferredDarkColorTheme" = "Tokyo Night Storm";
        "workbench.preferredLightColorTheme" = "Tokyo Night Light";
      };
    };
  };
}
