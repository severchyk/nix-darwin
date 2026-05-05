{ config, pkgs, ... }:

{
  imports = [
    ./programs/bash.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/vscode.nix
    ./programs/waveterm.nix
    ./programs/zed.nix
    ./programs/zsh.nix
  ];

  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      antigravity
      chatgpt
      claude-code
      google-chrome
      slack
      warp-terminal
    ];
  };
}
