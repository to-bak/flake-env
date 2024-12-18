# What is flake-env?
A nix flake which allows you to define an environment, which can be input from other flakes.

# Installation
1. Install [nix](https://nixos.org/download.html):
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```
2. Install flake-env using bootstrap-script. The flake is located in `$HOME/.flake-env`:
```
nix run github:to-bak/flake-env#bootstrap --extra-experimental-features "nix-command flakes"
```
3. Populate `$HOME/.flake-env/env.nix` with variables you desire.
