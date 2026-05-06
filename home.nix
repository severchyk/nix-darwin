{ config, pkgs, ... }:

{
  imports = [
    ./programs/bash.nix
    ./programs/claude-code.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/micro.nix
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
      google-chrome
      slack
      warp-terminal
    ];
  };
}
