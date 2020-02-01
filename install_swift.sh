#!/usr/bin/env bash

# Automatically installs swiftenv and run's swiftenv install.
# This script was designed for usage in CI systems.

mkdir -p $NETLIFY_CACHE_DIR/swift-custom/swift_version

export SWIFTENV_ROOT="${SWIFTENV_ROOT:-${HOME}/.swiftenv}"
git clone --depth 1 https://github.com/kylef/swiftenv.git "$SWIFTENV_ROOT"

if [ -d $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION ]
then
  rm -rf $SWIFTENV_ROOT/versions/$SWIFT_VERSION
  cp -p -r $NETLIFY_CACHE_DIR/swift-custom/swift_version/${SWIFT_VERSION} $SWIFTENV_ROOT/versions/
  swiftenv rehash
fi

swiftenv install -s $SWIFT_VERSION
eval "$(swiftenv init -)"

if ![ -d $NETLIFY_CACHE_DIR/swift-custom/swift_version/$SWIFT_VERSION ]
then
  rm -rf $NETLIFY_CACHE_DIR/swift-custom/swift_version
  mkdir $NETLIFY_CACHE_DIR/swift-custom/swift_version
  mv $SWIFTENV_ROOT/versions/$SWIFT_VERSION $NETLIFY_CACHE_DIR/swift-custom/swift_version/
fi
