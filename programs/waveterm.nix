{ config, pkgs, ... }:

{
  programs.waveterm = {
    enable = false;

    bookmarks = {
      "bookmark@claude" = {
        title = "Claude";
        url = "https://claude.ai";
      };
      "bookmark@github" = {
        title = "GitHub";
        url = "https://github.com";
      };
      "bookmark@google" = {
        title = "Google";
        url = "https://www.google.com";
      };
      "bookmark@random" = {
        title = "RANDOM.ORG";
        url = "https://random.org/passwords";
      };
    };

    settings = {
      "autoupdate:enabled" = false;
      "conn:askbeforewshinstall" = false;
      "conn:wshenabled" = false;
      "term:fontfamily" = "Roboto Mono";
      "term:fontsize" = 14;
      # "term:transparency" = 0.5;
      # "window:magnifiedblockblurprimarypx" = 10;
      # "window:magnifiedblockblursecondarypx" = 2;
      # "window:magnifiedblockopacity" = 0.6;
      # "window:magnifiedblocksize" = 0.9;
      "window:blur" = true;
      "window:opacity" = 0.7;
      "window:tilegapsize" = 10;
    };

    themes = {
      elementary-os = {
        background = "#2E2E2E";
        black = "#073642";
        blue = "#268BD2";
        brightBlack = "#605B65";
        brightBlue = "#839496";
        brightCyan = "#93A1A1";
        brightGreen = "#586E75";
        brightMagenta = "#6C71C4";
        brightRed = "#DC322F";
        brightWhite = "#FDF6E3";
        brightYellow = "#657B83";
        cmdtext = "#93A1A1";
        cursorAccent = "#839496";
        cyan = "#2AA198";
        "display:name" = "Elementary OS";
        "display:order" = 1;
        foreground = "#93A1A1";
        gray = "#8b918a";
        green = "#859900";
        magenta = "#D33682";
        red = "#DC322F";
        selectionBackground = "#93A1A1";
        white = "#EEE8D5";
        yellow = "#B58900";
      };
    };
  };
}
