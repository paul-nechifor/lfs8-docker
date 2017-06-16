# LFS8 Docker

An attempt at building [Linux from Scratch 8.0-systemd][lfs8book] by using
Docker.

## TODO

- Use docker commit instead of a Dockerfile so I can have access to privileged.
- Make sure you never write to the docker fs, but locally instead (for speed).

## Usage

1. Get the sources. This step is manual so that the rest of them can work
   without an internet connection.

       ./build get_sources

[lfs8book]: http://linuxfromscratch.org/lfs/downloads/8.0-systemd/LFS-BOOK-8.0-systemd-NOCHUNKS.html
