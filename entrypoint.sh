#!/bin/bash

set -xeu

BRANCH="v$VERSION"
DEBIAN_FRONTEND=noninteractive
DEB_BUILD_OPTIONS=parallel=$(nproc)
OS_VERSION=$(sed 's/\..*//' /etc/debian_version)
TARGET="$PWD"

export DEBIAN_FRONTEND DEB_BUILD_OPTIONS

dependencies() {
    apt update && apt install -y devscripts equivs git
}

get_sources() {
    cd "$(mktemp -d)"
    git clone -b "$BRANCH" https://github.com/authelia/authelia.git authelia
    cd authelia
    sed -i "s/__BUILD_TAG__/v$VERSION/" cmd/authelia/constants.go
    sed -i "s/__BUILD_COMMIT__/$(git rev-parse --verify v$VERSION)/" cmd/authelia/constants.go
}

build() {
    cp -a "$TARGET/debian" .
    yes | mk-build-deps --install
    dpkg-source --before-build .
    debian/rules binary
}

copy() {
    TARGET_UID="$(stat --printf %u "$TARGET")"
    TARGET_GID="$(stat --printf %g "$TARGET")"
    install -o "$TARGET_UID" -g "$TARGET_GID" -t "$TARGET/target" ../*.deb
}

main() {
    dependencies
    get_sources
    build
    copy
}

main
