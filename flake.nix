{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      in {
        flakedPkgs = pkgs;

        devShell = pkgs.mkShell {
          packages = with pkgs; [
            mermaid-cli
          ];

          GIT_CONFIG_GLOBAL =
            pkgs.writeText
              "git.conf"
              ''
                [user]
                    email = "noah.godel@edu.hefr.ch"
                    name = "Noah Godel"
              ''
          ;
        }; 
      }
    );
}
