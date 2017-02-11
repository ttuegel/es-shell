{ nixpkgs ? (import <nixpkgs> {}) }:

with nixpkgs;

(pkgs.callPackage ./default.nix {}).overrideDerivation (args: {
  src = ./.;
  nativeBuildInputs =
    (args.nativeBuildInputs or [])
    ++ (with pkgs; [ autoconf automake ]);
})
