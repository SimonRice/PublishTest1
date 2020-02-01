#!/bin/bash

# Swiftenv setup
export SWIFTENV_ROOT="${SWIFTENV_ROOT:-${HOME}/.swiftenv}"
git clone --depth 1 https://github.com/kylef/swiftenv.git "$SWIFTENV_ROOT"
export PATH="$SWIFTENV_ROOT/bin:$SWIFTENV_ROOT/shims:$PATH"

if [ -f .swift-version ]
then
  SWIFT_VERSION=$(cat .swift-version)
fi

# Check cache for Swift version
if [ -d $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION ]
then
  rm -rf $SWIFTENV_ROOT/versions/$SWIFT_VERSION
  mkdir -p $SWIFTENV_ROOT/versions
  cp -p -r $NETLIFY_CACHE_DIR/swift-custom/swift_version/${SWIFT_VERSION} $SWIFTENV_ROOT/versions/$SWIFT_VERSION
  swiftenv rehash
fi

# Install Swift version
swiftenv install -s $SWIFT_VERSION

# Cache Swift version
if [ ! -d $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION ]
then
  rm -rf $NETLIFY_CACHE_DIR/swift-custom/swift_version
  mkdir -p $NETLIFY_CACHE_DIR/swift-custom/swift_version
  cp -p -r $SWIFTENV_ROOT/versions/$SWIFT_VERSION $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION
fi
