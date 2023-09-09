# darwin-dots
> A nix flake containing a complete system setup for macOS Ventura

This project provides a template to MacOS users who wish to benefit from the reproducible and declarative system configuration provided by [Nix and NixOS](https://nixos.org/).
By leveraging [Nix-Darwin](https://github.com/LnL7/nix-darwin) and [Home Manager](https://github.com/nix-community/home-manager), this project provides users with a way of tracking each and every change to their system. 
All installed programs and settings are now listed in their respective files, allowing for quick and easy reproduction on any supported MacOS machine.
Instead of fiddling with installation wizards and system menus, *darwin-dots* provides users with an efficient method to setup their favourite development environment.

## DISCLAIMER
You should be familiar with the Nix and NixOS before attempting to install this flake, as `Nix` error messages are usually difficult to interpret.
This is an opinionated system configuration, containing my favourite development tools. Therefore, feel free to fork this repository to suit your own needs.

### Requirements

1. The **xcode cli tools**
```xcode-select –install```
2. A working installation of the [Nix Package Manager for MacOS](https://nixos.org/download#nix-install-macos)
```sh <(curl -L https://nixos.org/nix/install)```

### Step 1: Clone this repository into `~/.config/darwin`
```
cd ~/.config/
git clone https://github.com/philippeLL1/darwin-dots.git darwin
```
### Step 2: Install Nix-Darwin with the Provided Flake
```
nix --extra-experimental-features 'nix-command flake' run nix-darwin -- switch --flake ~/.config/darwin
```

## Usage
After making changes to the `.nix` files, run the following command: 
```
darwin-rebuild switch --flake ~/.config/darwin
```
This will apply the changes to your system.

## Resources
1. [Nix Reference Manual](https://nixos.org/manual/nix/stable/)
2. [Nix-Darwin Configuration Options](https://daiderd.com/nix-darwin/manual/index.html)
3. [Home Manager Configuration Options](https://rycee.gitlab.io/home-manager/options.html)
