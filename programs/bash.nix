{ ... }:

{
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
}
