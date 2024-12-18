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
            GIT_CONFIG_GLOBAL=/dev/null git clone https://github.com/to-bak/flake-env.git "$ENV_DIR" && \
            rm -rf "$ENV_DIR"/.git && \
            git init "$ENV_DIR" && \
            nix registry add flake:flake-env git+file:///"$ENV_DIR"/
          '';
        };
      });
}
