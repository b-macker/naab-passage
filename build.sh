#!/bin/bash
# Build NAAb from submodule for naab-passage
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
NAAB_DIR="$SCRIPT_DIR/naab"

if [ ! -f "$NAAB_DIR/CMakeLists.txt" ]; then
    echo "Initializing NAAb submodule..."
    cd "$SCRIPT_DIR"
    git submodule update --init --recursive
fi

echo "Building NAAb..."
mkdir -p "$NAAB_DIR/build"
cd "$NAAB_DIR/build"
cmake .. -DCMAKE_BUILD_TYPE=Release
make naab-lang -j$(nproc 2>/dev/null || echo 4)

echo ""
echo "✓ NAAb built successfully!"
echo "Binary: $NAAB_DIR/build/naab-lang"
echo ""
echo "Run: ./naab/build/naab-lang main.naab"
