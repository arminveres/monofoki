{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.fontforge pkgs.ttfautohint pkgs.nerd-font-patcher pkgs.python3Packages.fonttools ];
}
