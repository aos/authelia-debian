#!/usr/bin/env bash
set -eu
VERSION="4.29.0-1"

while getopts "v:h" opt
do
    case "$opt" in
        v)
            VERSION="$OPTARG"
            ;;
        h)
            echo "Usage: $0 [-v version]"
            exit 0
            ;;
        *)
            exit 1
            ;;
    esac
done

PACKAGE_FILE=${PACKAGE_FILE:-target/authelia_${VERSION}_amd64.deb}

main() {

  curl \
    --verbose \
    --http1.1 \
    --progress-bar \
    --header "Authorization: Bearer ${PUSH_TOKEN}" \
    --form "package=@${PACKAGE_FILE}" \
    --form "readme=<repo-readme.md" \
    --form distribution=all \
    https://authelia.baltorepo.com/stable/debian/upload/
}

main
