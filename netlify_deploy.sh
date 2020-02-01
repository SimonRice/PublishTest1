#!/usr/bin/env bash

# Create caches (if not there)
# export NETLIFY_CACHE_DIR="/opt/buildhome/cache"
# mkdir -p $NETLIFY_CACHE_DIR/swift-custom

echo "Showing Swift cache"
echo ${NETLIFY_CACHE_DIR}
# ls -la $NETLIFY_CACHE_DIR/
# ls -la $NETLIFY_CACHE_DIR/swift-custom/

# Restore SPM Cache
# if [ -d $NETLIFY_CACHE_DIR/swift-custom/.build ]
# then
#   rm -rf .build
#   cp -p -r $NETLIFY_CACHE_DIR/swift-custom/.build .
# fi

eval "$(cat install_swift.sh)"
swift run

# Cache new build dir

# rm -rf $NETLIFY_CACHE_DIR/swift-custom/.build
# cp -p -r .build $NETLIFY_CACHE_DIR/swift-custom/.build

# ls -la $NETLIFY_CACHE_DIR/swift-custom/
# ls -la $NETLIFY_CACHE_DIR/swift-custom/.build
# ls -la $NETLIFY_CACHE_DIR/swift-custom/swift_version
