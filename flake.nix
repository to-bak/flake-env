{
  description = "Nix environment flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = inputs@{ nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        nixosModules = { environment = import ./environment.nix; };
        packages.bootstrap = pkgs.writeShellApplication {
          name = "bootstrap";
          runtimeInputs = [ pkgs.git ];
          text = ''
            ENV_DIR=$HOME/.flake-env
            git clone https://github.com/to-bak/flake-env.git "$ENV_DIR" && \
            rm -rf "$ENV_DIR"/.git
          '';
        };
      });
}
