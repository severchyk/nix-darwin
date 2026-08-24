{ config, pkgs, ... }:

{
  imports = [
    ./programs/bash.nix
    ./programs/claude-code.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/mc.nix
    ./programs/micro.nix
    ./programs/vscode.nix
    ./programs/waveterm.nix
    ./programs/zed.nix
    ./programs/zsh.nix
  ];

  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      antigravity-ide
      chatgpt
      google-chrome
      slack
      # warp-terminal

      ansible
      awscli2
      coreutils-prefixed
      eksctl
      fzf
      jq
      jqp
      k9s
      kubectl
      lazycli
      lazydocker
      lazygit
      lazyjournal
      lazysql
      lazyssh
      postgresql
      terraform
      wget
    ];
  };
}
