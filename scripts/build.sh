#!/bin/bash
set -e

echo "[INFO] Building Rompacta with Fontmake..."
fontmake -u sources/rompacta.ufo --verbose ERROR
echo "[INFO] Done building Rompacta with Fontmake..."

echo "[INFO] Moving font output..."
cp master_ttf/rompacta.ttf fonts/static/Rompacta-Regular.ttf
echo "[INFO] Done moving font output..."

echo "[INFO] Removing font build directories..."
rm -rf master_otf master_ttf
echo "[INFO] Done removing font build directories..."

echo "[INFO] Fixing dsig table with gftools..."
gftools fix-dsig fonts/static/Rompacta-Regular.ttf --autofix > /dev/null
echo "[INFO] Done fixing dsig table with gftools..."

echo "[INFO] Fixing nonhinting with gftools..."
gftools fix-nonhinting fonts/static/Rompacta-Regular.ttf hot-fix.ttf > /dev/null
mv hot-fix.ttf fonts/static/Rompacta-Regular.ttf
rm -rf fonts/static/Rompacta-Regular-backup-fonttools-prep-gasp.ttf
echo "[INFO] Done fixing nonhinting with gftools..."
