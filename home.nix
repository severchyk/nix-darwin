{ config, pkgs, ... }:

{
  home = {
    homeDirectory = "/Users/severyn-matsiak";
    username = "severyn-matsiak";
    stateVersion = "26.05";

    packages = with pkgs; [
      chatgpt
      google-chrome
      slack
      warp-terminal
    ];
  };

  # Configure ~/.bashrc
  programs.bash = {
    enable = true;

    bashrcExtra = ''
      neofetch
    '';

    initExtra = ''
      du() {
        command gdu -h --max-depth 1 "$@" | sort -hr
      }
      rssh() {
        ssh $(grep -E '^Host ' ~/.ssh/config | cut -d ' ' -f2 | sort | fzf)
      }
      rmc() {
        MC_PROFILE_ROOT=~/.mc-server-connect mc sftp://$(grep -E '^Host ' ~/.ssh/config | cut -d ' ' -f2 | sort | fzf)
      }
    '';

    shellAliases = {
      # Add colors for filetype and human-readable sizes by default on 'ls':
      ls = "gls -h --color=auto"; # Use GNU Coreutils ls version.
      lx = "ls -lXB";  # Sort by extension.
      lk = "ls -lSr";  # Sort by size, biggest last.
      lt = "ls -ltr";  # Sort by date, most recent last.
      lc = "ls -ltcr"; # Sort by/show change time, most recent last.
      lu = "ls -ltur"; # Sort by/show access time, most recent last.

      # The ubiquitous 'll': directories first, with alphanumeric sorting:
      ll = "ls -alv --group-directories-first";
      lm = "ll | more";    #  Pipe through 'more'
      lr = "ll -R";        #  Recursive ls.
      la = "ll -A";        #  Show hidden files.
      tree = "tree -Csuh"; #  Nice alternative to 'recursive ls' ...

      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";

      df = "gdf -h";

      ".." = "cd ..";
    };

    shellOptions = [
      "checkwinsize"
      "globstar"
      "histappend"
    ];
  };

  # Configure ~/.zshrc
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "strug";
    };

    loginExtra = ''
      neofetch
    '';

    shellAliases = {
      # Add colors for filetype and human-readable sizes by default on 'ls':
      ls = "gls -h --color=auto"; # Use GNU Coreutils ls version.
      lx = "ls -lXB";  # Sort by extension.
      lk = "ls -lSr";  # Sort by size, biggest last.
      lt = "ls -ltr";  # Sort by date, most recent last.
      lc = "ls -ltcr"; # Sort by/show change time, most recent last.
      lu = "ls -ltur"; # Sort by/show access time, most recent last.

      # The ubiquitous 'll': directories first, with alphanumeric sorting:
      ll = "ls -alv --group-directories-first";
      lm = "ll | more";    #  Pipe through 'more'
      lr = "ll -R";        #  Recursive ls.
      la = "ll -A";        #  Show hidden files.
      tree = "tree -Csuh"; #  Nice alternative to 'recursive ls' ...

      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";

      df = "gdf -h";

      ".." = "cd ..";
    };

    siteFunctions = {
      du = ''
        command gdu -h --max-depth 1 "$@" | sort -hr
      '';
      rssh = ''
        ssh $(grep -E '^Host ' ~/.ssh/config | cut -d ' ' -f2 | sort | fzf)
      '';
      rmc = ''
        MC_PROFILE_ROOT=~/.mc-server-connect mc sftp://$(grep -E '^Host ' ~/.ssh/config | cut -d ' ' -f2 | sort | fzf)
      '';
    };
  };

  # Install Ghostty.
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    # Specify darwin package.
    package = pkgs.ghostty-bin;

    settings = {
      background-opacity = 0.9;
      background-blur = true;
      cursor-style = "block";
      focus-follows-mouse = true;
      font-family = "Roboto Mono";
      font-size = 14;
      #initial-command = "neofetch";
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
      theme = "Spiderman";
      #theme = "Synthwave";
      #theme = "Synthwave Alpha";
      #theme = "Synthwave Everything";
      #theme = "dark:TokyoNight,light:TokyoNight Day";
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

  # Install VSCode.
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

    profiles.White = {
      extensions = with pkgs.vscode-marketplace; [
        arthurwhite.white
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
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
        "workbench.preferredDarkColorTheme" = "White Night";
        "workbench.preferredLightColorTheme" = "White";
      };
    };
  };
}
