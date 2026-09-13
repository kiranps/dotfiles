# AGENTS.md

## Repo Type

Personal dotfiles managed with **Nix flakes**. No traditional build system, test suite, or linter. All configuration is declarative Nix; changes are applied by rebuilding the relevant flake output.

## Directory Structure

```
~/.dotfiles/
├── flake.nix           # All flake outputs (NixOS, home-manager, nix-darwin)
├── flake.lock          # Pinned inputs
├── .luarc.json         # Lua LSP workspace config (for neovim nix files)
├── darwin/             # nix-darwin config for macbook_pro_m1 (aarch64-darwin)
│   ├── homebrew.nix    # Homebrew packages via nix-darwin
│   ├── sketchybar/     # Sketchybar status bar config
│   ├── skhd.nix        # Hotkey daemon
│   └── yabai.nix       # Tiling window manager
├── home/
│   ├── common/         # Shared home-manager modules
│   │   ├── neovim/     # Neovim config split into: options, keymaps, ui, lsp, ai,
│   │   │               #   testing, telescope, git, extraPackages
│   │   ├── wayland/    # Wayland/sway-specific config
│   │   ├── packages.nix
│   │   ├── zsh.nix
│   │   ├── git.nix
│   │   ├── tmux.nix
│   │   └── ...
│   ├── kiran/          # Home config for user "kiran"
│   └── makhang/        # Home config for user "makhang"
└── nixos/
    ├── common/         # Shared NixOS modules (fonts)
    ├── thinkpad_e480/  # NixOS config for Thinkpad E480 (x86_64-linux)
    └── ideapad_gaming/ # NixOS config for Ideapad Gaming (x86_64-linux)
```

## Flake Outputs

| Output | Description |
|---|---|
| `nixosConfigurations.thinkpad_e480` | NixOS, x86_64-linux |
| `nixosConfigurations.ideapad_gaming` | NixOS, x86_64-linux |
| `darwinConfigurations.macbook_pro_m1` | nix-darwin, aarch64-darwin |
| `homeConfigurations.kiran` | home-manager standalone, x86_64-linux |
| `homeConfigurations.makhang` | home-manager standalone, x86_64-linux |

## Apply Commands

Run from the repo root on the target machine.

**NixOS:**
```sh
sudo nixos-rebuild switch --flake .#thinkpad_e480
sudo nixos-rebuild switch --flake .#ideapad_gaming
```

**home-manager (standalone Linux):**
```sh
home-manager switch --flake .#kiran
home-manager switch --flake .#makhang
```

** clean
```sh
nix-env --delete-generations old --profile ~/.local/state/nix/profiles/home-manager
nix profile wipe-history
nix-collect-garbage -d
```

**nix-darwin (macOS):**
```sh
darwin-rebuild switch --flake .#macbook_pro_m1
```

## Build / Validate Without Activating

```sh
# Check flake evaluates without errors
nix flake check

# Show all outputs
nix flake show

# Build a specific output (creates ./result symlink)
nix build .#nixosConfigurations.thinkpad_e480.config.system.build.toplevel
nix build .#homeConfigurations.kiran.activationPackage
```

`result/` is gitignored.

## Update Inputs

```sh
nix flake update                  # update all inputs
nix flake update nixpkgs          # update a single input
nix flake lock --update-input nixpkgs
nix flake lock --update-input nixpkgs-stable
nix flake lock --update-input home-manager
```

## No Tests, No Linter, No CI

- No test suite. Validation = `nix flake check` + `nix build`.
- No formatter enforced in CI. `nix fmt` may work if a formatter is configured in future.
- No `.github/` workflows, no pre-commit hooks.

## Toolchain / Key Conventions

- **nixpkgs track:** `nixos-unstable` for most packages. `nixpkgs-stable` (25.05) is available as `pkgs-stable` and used for the kernel on thinkpad (`linuxPackages_latest`).
- **home-manager and nix-darwin** both `follows = "nixpkgs"` (unstable).
- **Nix experimental features required:** `nix-command` and `flakes` must be enabled (`nix.settings.experimental-features`).
- **Shell:** zsh + oh-my-zsh + starship prompt. `jk` mapped to vi-cmd-mode. Aliases: `v`=nvim, `q`=exit, `lsl`=eza long.
- **SSH via GPG agent:** `SSH_AUTH_SOCK` is set to the gpg-agent socket in zsh init. GPG key `D427467DD7929EF0A44CC93653080CE17F7DEA45`.
- **Git:** GPG signing by default; `pull.ff = "only"`; `push.default = "current"`; GitHub URLs rewritten to SSH.
- **direnv + nix-direnv** enabled globally for per-project nix shells.
- **`allowUnfree = true`** in both nixpkgs instances.
- **Neovim** config lives entirely in `home/common/neovim/*.nix`. `.luarc.json` at repo root points lua-language-server at nix store paths — these paths will be stale after a neovim package rebuild and must be regenerated.
- **macOS:** Homebrew packages managed declaratively via nix-darwin. Window manager stack: yabai + skhd + sketchybar.
- **Linux desktop:** Wayland/sway, launched via `tuigreet --cmd sway` (greetd).
- **Virtualization** (thinkpad): podman (with docker compat alias), libvirtd, KVM.
