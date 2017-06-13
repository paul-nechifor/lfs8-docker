FROM debian:8

ENV LFS=/mnt/lfs

COPY src/001-provision /tmp
RUN /tmp/001-provision
COPY src/002-version-check /src
RUN /src/002-version-check
COPY src/003-create-dirs-and-user /src
RUN /src/003-create-dirs-and-user

USER lfs

COPY src/004-setup-user /src
RUN /src/004-setup-user

ENV  LC_ALL=POSIX \
  LFS_TGT=x86_64-lfs-linux-gnu \
  PATH=/tools/bin:/bin:/usr/bin \
  MAKEFLAGS="-j 8"

COPY sources/binutils-2.27.tar.bz2 $LFS/sources
COPY src/005-binutils-pass1 /src
RUN /src/005-binutils-pass1

COPY sources/gcc-6.3.0.tar.bz2 sources/mpfr-3.1.5.tar.xz sources/gmp-6.1.2.tar.xz sources/mpc-1.0.3.tar.gz $LFS/sources/
COPY src/006-gcc-pass1 /src
RUN /src/006-gcc-pass1

COPY sources/linux-4.9.9.tar.xz $LFS/sources/
COPY src/007-linux-api-headers /src
RUN /src/007-linux-api-headers

COPY sources/glibc-2.25.tar.xz $LFS/sources/
COPY src/008-glibc /src
RUN /src/008-glibc

COPY src/009-libstdcpp /src
RUN /src/009-libstdcpp

COPY src/010-binutils-pass2 /src
RUN /src/010-binutils-pass2

COPY src/011-gcc-pass2 /src
RUN /src/011-gcc-pass2

COPY sources/tcl-core8.6.6-src.tar.gz $LFS/sources/
COPY src/012-tcl-core /src
RUN /src/012-tcl-core

COPY sources/expect5.45.tar.gz $LFS/sources/
COPY src/013-expect /src
RUN /src/013-expect

COPY sources/dejagnu-1.6.tar.gz $LFS/sources/
COPY src/014-dejagnu /src
RUN /src/014-dejagnu

COPY sources/check-0.11.0.tar.gz $LFS/sources/
COPY src/015-check /src
RUN /src/015-check

COPY sources/ncurses-6.0.tar.gz $LFS/sources/
COPY src/016-ncurses /src
RUN /src/016-ncurses

COPY sources/bash-4.4.tar.gz $LFS/sources/
COPY src/017-bash /src
RUN /src/017-bash

COPY sources/bison-* $LFS/sources/
COPY src/018-bison /src
RUN /src/018-bison

COPY sources/bzip2-*.tar.* $LFS/sources/
COPY src/019-bzip2 /src
RUN /src/019-bzip2

COPY sources/coreutils-*.tar.* $LFS/sources/
COPY src/020-coreutils /src
RUN /src/020-coreutils

COPY sources/diffutils-* $LFS/sources/
COPY src/021-diffutils /src
RUN /src/021-diffutils

COPY sources/file-* $LFS/sources/
COPY src/022-file /src
RUN /src/022-file

COPY sources/findutils-* $LFS/sources/
COPY src/023-findutils /src
RUN /src/023-findutils

COPY sources/gawk-* $LFS/sources/
COPY src/024-gawk /src
RUN /src/024-gawk

COPY sources/gettext-* $LFS/sources/
COPY src/025-gettext /src
RUN /src/025-gettext
