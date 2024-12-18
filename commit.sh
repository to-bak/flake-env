#!/bin/bash

nix-shell -p git --run "git init && nix registry add flake:flake-env git+file:///"$HOME"/.flake-env/"
