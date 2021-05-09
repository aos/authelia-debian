# authelia-debian

This repository contains the source to build a Debian package for [authelia](https://github.com/authelia/authelia).

## Usage

On Mac? Install prerequisites: `brew install findutils coreutils`

If you have [Docker](https://www.docker.com/) installed locally, just run the following:

```bash
user@hostname$ ./build.sh
```
By default this will build authelia v4.29.0 on Debian Buster.

If you want to customize the build at runtime, use the following:

```bash
user@hostname$ ./build.sh -i golang:1.16-3-stretch -v 4.28.0
```
Don't forget to update `debian/changelog` so your package is generated with the correct version.

## References

* [ayosec/polybar-debian](https://github.com/ayosec/polybar-debian)
