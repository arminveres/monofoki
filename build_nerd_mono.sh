#!/usr/bin/env bash
# Build "Monofoki Nerd Font Mono" TTFs from src/*.sfd into export/nf/.
# Needs fontforge and nerd-font-patcher, e.g.:
#   nix-shell -p fontforge nerd-font-patcher --run ./build_nerd_mono.sh
# shortcut: skips create_font.sh cleanup/hinting (overlap removal, extrema); upgrade by patching its output instead.
set -euo pipefail
mkdir -p export/nf
for s in Regular Italic Bold Bold-Italic; do
  fontforge -lang=py -c "
import fontforge
f = fontforge.open('src/monofoki-$s.sfd')
for g in f.glyphs():
    g.unlinkRef()
f.generate('export/Monofoki-$s.ttf')"
  nerd-font-patcher --complete --mono --outputdir export/nf "export/Monofoki-$s.ttf"
done
cp LICENSE export/nf/LICENSE-Monofoki
