#!/usr/bin/env bash

unset URL

# Create caches
export NETLIFY_CACHE_DIR="/opt/buildhome/cache"

# Restore SPM Cache


eval "$(cat install_swift.sh)"
swift run

# Cache new build dir
rm -rf $NETLIFY_CACHE_DIR/swift-custom/.swift-build
cp -p -r .build $NETLIFY_CACHE_DIR/swift-custom/
