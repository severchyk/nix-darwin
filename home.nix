{ config, pkgs, ... }:

{
  imports = [
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/vscode.nix
    ./programs/waveterm.nix
    ./programs/zed.nix
  ];

  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      antigravity
      chatgpt
      claude-code
      slack
      warp-terminal
    ];
  };

  # Configure ~/.bashrc
  programs.bash = {
    enable = true;

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
}
