#!/bin/bash

nix-shell -p git --run 'GIT_CONFIG_GLOBAL=/dev/null git add . && GIT_CONFIG_GLOBAL=/dev/null git commit --allow-empty "update flake-env"'
