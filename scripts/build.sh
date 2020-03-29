#!/bin/bash
set -e

echo "[INFO] Building Rompacta with Fontmake..."
fontmake -u sources/rompacta.ufo
echo "[INFO] Done building Rompacta with Fontmake..."

echo "[INFO] Moving font output..."
cp master_ttf/rompacta.ttf fonts/static/Rompacta.ttf
echo "[INFO] Done moving font output..."

echo "[INFO] Removing font build directories..."
rm -rf master_otf master_ttf
echo "[INFO] Done removing font build directories..."

echo "[INFO] Fixing dsig table with gftools..."
gftools fix-dsig fonts/static/Rompacta.ttf --autofix
echo "[INFO] Done fixing dsig table with gftools..."
