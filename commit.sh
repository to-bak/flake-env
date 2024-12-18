#!/bin/bash
nix-shell -p git --run "cd $HOME/.flake-env && git add . && git config user.email 'flake-env@github.com' && git config user.name 'flake-env' && git commit --allow-empty -m 'update flake-env'"
