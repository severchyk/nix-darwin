{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-vscode-extensions, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # Allow unfree packages.
      nixpkgs.config.allowUnfree = true;

      nixpkgs.overlays = [
        nix-vscode-extensions.overlays.default
      ];

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        awscli2
        bat
        coreutils-prefixed
        fzf
        git
        ipfetch
        jq
        jqp
        kubectl
        kubernetes-helm
        lazycli
        lazydocker
        lazygit
        lazyjournal
        lazysql
        lazyssh
        mc
        neofetch
        nixfmt
        postgresql
        tree
        unzip
        vim
        wget
      ];

      # Install fonts.
      fonts.packages = with pkgs; [
        roboto-mono
      ];

      # Set system settings.
      system.defaults = {
        CustomUserPreferences = {
          # Disable screensaver.
          "com.apple.screensaver" = {
            idleTime = 0;
          };
        };

        dock = {
          autohide = false;
          orientation = "left";
          persistent-apps = [
            "/System/Applications/Apps.app"
            "${pkgs.chatgpt}/Applications/ChatGPT.app"
            "${pkgs.google-chrome}/Applications/Google Chrome.app"
            "${pkgs.slack}/Applications/Slack.app"
            "${pkgs.ghostty-bin}/Applications/Ghostty.app"
            "/System/Applications/Utilities/Terminal.app"
            "${pkgs.warp-terminal}/Applications/Warp.app"
            "${pkgs.vscode}/Applications/Visual Studio Code.app"
          ];
          show-recents = false;
        };

        finder = {
          _FXSortFoldersFirst = true;
          AppleShowAllExtensions = true;
          AppleShowAllFiles = true;
          FXPreferredViewStyle = "clmv";
          ShowStatusBar = true;
        };

        loginwindow.autoLoginUser = "Severyn Matsiak";
        loginwindow.GuestEnabled = false;

        NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
      };

      system.primaryUser = "severyn-matsiak";
      users.users.severyn-matsiak.home = "/Users/severyn-matsiak";

      # Prevent VM from going to sleep.
      power.sleep = {
        display = "never";
        harddisk = "never";
      };

      # Set VM hostname.
      networking = {
        computerName = "UTM Virtual Machine";
        hostName = "work";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#work
    darwinConfigurations."work" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.severyn-matsiak = ./home.nix;
        }
      ];
    };
  };
}
