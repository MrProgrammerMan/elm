{
  description = "Elm frontend + Servant backend";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            just

            # Haskell (cabal pulls servant/warp from Hackage)
            haskellPackages.ghc
            haskellPackages.cabal-install
            haskellPackages.Cabal_3_16_1_0
            haskellPackages.haskell-language-server
            zlib

            # Elm (elm-ui itself is an Elm package: `elm install mdgriffith/elm-ui`)
            elmPackages.elm
            elmPackages.elm-format
            elmPackages.elm-test
            elmPackages.elm-language-server
            elmPackages.elm-live
          ];
        };
      };
    };
}
