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
      background-opacity = 0.95;
      # background-blur = true;
      cursor-style = "block";
      focus-follows-mouse = true;
      font-family = "Roboto Mono";
      font-size = 14;
      #initial-command = "neofetch";
      mouse-scroll-multiplier = 6;
      shell-integration = "detect";
      shell-integration-features = "no-cursor";
      term = "xterm-256color";
      theme = "Apple System Colors";
      #theme = "Espresso";
      #theme = "elementary-os";
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
