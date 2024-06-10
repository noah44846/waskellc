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
          buildInputs = with pkgs; [
            pkg-config
          ];

          packages = with pkgs; [
            mermaid-cli
            pandoc
            texliveTeTeX

            cargo-wasi
            cargo-component

            openssl
            
            wasmtime
            wasm-tools

            nodejs_20
            nodePackages.npm
          ];

          PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";

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
