{ lang ? "go" }:
let
  pkgs = import <nixpkgs> { };
  shell = import ./shells/${lang}/default.nix { inherit pkgs; name = lang; };
in
  shell