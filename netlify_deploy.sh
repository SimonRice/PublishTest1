#!/usr/bin/env bash

unset URL

# Create caches (if not there)
export NETLIFY_CACHE_DIR="/opt/build/cache"
mkdir -p $NETLIFY_CACHE_DIR/swift-custom

# Restore SPM Cache
if [ -d $NETLIFY_CACHE_DIR/swift-custom/swift-build ]
then
  rm -rf .build
  cp -p -r $NETLIFY_CACHE_DIR/swift-custom/swift-build .build
fi

eval "$(cat install_swift.sh)"
swift run

# Cache new build dir
rm -rf $NETLIFY_CACHE_DIR/swift-custom/swift-build
cp -p -r .build $NETLIFY_CACHE_DIR/swift-custom/swift-build
ls -la $NETLIFY_CACHE_DIR/swift-custom/swift-build
