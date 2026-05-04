{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    # This populates the userSettings "auto_install_extensions"
    extensions = [
      "dockerfile"
      "ini"
      "nix"
      "rainbow-csv"
      "terraform"
      "blade-runner-2049"
      "catppuccin"
      "catppuccin-blur"
      "catppuccin-icons"
      "github-theme"
      "macos-classic"
      "tokyo-night"
      "vscode-dark-modern"
      "vscode-icons"
    ];

    # Everything inside of these brackets are Zed options
    userSettings = {
      auto_update = false;

      session = {
        trust_all_worktrees = true;
      };

      # Tell Zed to use direnv and direnv can use a flake.nix environment
      load_direnv = "shell_hook";
      base_keymap = "VSCode";

      # show_whitespaces = "all";
      ui_font_size = 16;
      buffer_font_size = 15;

      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
    };
  };
}
