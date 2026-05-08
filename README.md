# macOS work environment managed by nix

This repo assumes the **main macOS user already exists**.

That user is **not** created by Nix on first boot. Create it manually in one of these ways:

- during macOS Setup Assistant on a fresh machine
- in **System Settings -> Users & Groups**

## Bootstrap flow

### 1. Create the macOS user

Example:

- full name: `Severyn Matsiak`
- user name: `severyn-matsiak`
- home directory: `/Users/severyn-matsiak`

Sign in as that user and make sure `sudo` works.

### 2. Install Nix

Nix can be installed with:

- [Official Nix install script](https://nixos.org/nix/install)
- [Official Nix installer](https://github.com/NixOS/nix-installer)
- [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

Main differences are well described here: https://zenn.dev/trifolium/articles/da11a428c53f65?locale=en

> [!IMPORTANT]
> You need to use `--extra-experimental-features "nix-command flakes"` with all `nix` commands to install nix-darwin configuration in case of using the install script.

> [!WARNING]
> There is an issue with zsh affecting other users than the one performing Nix install using install script:
> ```bash
> zsh compinit: insecure directories and files, run compaudit for list.
> Ignore insecure directories and files and continue [y] or abort compinit [n]?
> ```

<details>
<summary>Official Nix install script</summary>
<br>

On macOS, use the multi-user installer:

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

Then open a new shell and verify:

```bash
nix --version
```

```bash
nix --extra-experimental-features "nix-command" config check
```

Backup bashrc and zshrc before switch:

```bash
sudo mv /etc/bashrc /etc/bashrc.backup-before-nix-darwin
```

```bash
sudo mv /etc/zshrc /etc/zshrc.backup-before-nix-darwin
```

</details>

<details>
<summary>Official Nix installer (RECOMMENDED)</summary>
<br>

Install Nix with flakes enabled:

```bash
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
```

Then open a new shell and verify:

```bash
nix --version
```

```bash
nix config check
```

</details>

### 3. Apply the configuration

Check available macOS configurations:

```bash
nix eval github:severchyk/nix-darwin#darwinConfigurations --apply builtins.attrNames
```

For the normal machine profile:

```bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake github:severchyk/nix-darwin#work
```

For the VM profile:

```bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake github:severchyk/nix-darwin#vm
```

## Daily use

Make a local working copy of this repo:

```bash
sudo mkdir -p /etc/nix-darwin
sudo chown "$(id -un)":"$(id -gn)" /etc/nix-darwin
git clone git@github.com:severchyk/nix-darwin.git /etc/nix-darwin
```

After the first successful switch, most updates are just:

```bash
sudo darwin-rebuild switch --flake /etc/nix-darwin#work
```

Update flake inputs:

```bash
cd /etc/nix-darwin
nix flake update
sudo darwin-rebuild switch --flake .#work
```

Garbage collection:

```bash
sudo nix-collect-garbage -d
```

Upgrade Nix:

```bash
sudo -i nix upgrade-nix
```

Alternatively, you can uninstall and reinstall with a different version of the installer.

Uninstalling:

```bash
/nix/nix-installer uninstall
```

## What is opinionated here

This setup is intentionally not generic. Right now it assumes:

- Apple Silicon by default
- a single primary user
- Home Manager integrated through `nix-darwin`
- GUI apps installed declaratively, including ChatGPT, Chrome, Slack, Warp, Ghostty, VS Code, and Zed
- a developer-focused CLI stack with Kubernetes, Terraform, AWS, and terminal tooling

## Troubleshooting

If you want to validate without switching:

```bash
nix flake check github:severchyk/nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild -- build --flake github:severchyk/nix-darwin#work
```

## References

- Nix install docs: https://nixos.org/download/
- Nix installer manual: https://releases.nixos.org/nix/nix-2.34.7/manual/installation/index.html
- nix-darwin: https://github.com/nix-darwin/nix-darwin
