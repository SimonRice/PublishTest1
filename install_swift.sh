#!/usr/bin/env bash

# Automatically installs swiftenv and run's swiftenv install.
# This script was designed for usage in CI systems.

# Swiftenv setup
export SWIFTENV_ROOT="${SWIFTENV_ROOT:-${HOME}/.swiftenv}"
git clone --depth 1 https://github.com/kylef/swiftenv.git "$SWIFTENV_ROOT"
export PATH="$SWIFTENV_ROOT/bin:$SWIFTENV_ROOT/shims:$PATH"
export NETLIFY_CACHE_DIR="${HOME}/cache"

# Check cache for Swift version
if [ -d $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION ]
then
  rm -rf $SWIFTENV_ROOT/versions/$SWIFT_VERSION
  cp -p -r $NETLIFY_CACHE_DIR/swift-custom/swift_version/${SWIFT_VERSION} $SWIFTENV_ROOT/versions/
  swiftenv rehash
fi

# Install Swift version
swiftenv install -s $SWIFT_VERSION
eval "$(swiftenv init -)"

# Cache Swift version
if ![ -d $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION ]
then
  rm -rf $NETLIFY_CACHE_DIR/swift-custom/swift_version
  mkdir $NETLIFY_CACHE_DIR/swift-custom/swift_version
  mv $SWIFTENV_ROOT/versions/$SWIFT_VERSION $NETLIFY_CACHE_DIR/swift-custom/swift_version/
fi
