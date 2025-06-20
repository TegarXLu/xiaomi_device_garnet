#!/bin/bash

# Gunakan cache
export USE_CCACHE=1
export CCACHE_EXEC=$(which ccache)

# Gunakan direktori cache yang aman di CI atau lokal
if [ -n "$RUNNER_TEMP" ]; then
    export CCACHE_DIR="$RUNNER_TEMP/ccache"
else
    export CCACHE_DIR="$HOME/.ccache"
fi

# Buat direktori jika belum ada dan beri izin akses penuh
mkdir -p "${CCACHE_DIR}/tmp"
chmod -R u+rwx "${CCACHE_DIR}"

# Set batas maksimal ukuran cache
ccache -M "${CCACHE_MAXSIZE:-32G}"

# Tampilkan info debug
echo "Using CCACHE_DIR: $CCACHE_DIR"
ccache -s
