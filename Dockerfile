FROM debian:8

ENV LFS=/mnt/lfs

COPY src/provision /tmp/provision
RUN /tmp/provision
COPY src/version-check /src/version-check
RUN /src/version-check
COPY src/create-dirs-and-user /src/create-dirs-and-user
RUN /src/create-dirs-and-user

USER lfs

COPY src/setup-user /src/setup-user
RUN /src/setup-user

ENV  LC_ALL=POSIX \
  LFS_TGT=x86_64-lfs-linux-gnu \
  PATH=/tools/bin:/bin:/usr/bin \
  MAKEFLAGS="-j 8"

COPY sources/binutils-2.27.tar.bz2 $LFS/sources
COPY src/binutils-pass1 /src
RUN /src/binutils-pass1

COPY sources/gcc-6.3.0.tar.bz2 sources/mpfr-3.1.5.tar.xz sources/gmp-6.1.2.tar.xz sources/mpc-1.0.3.tar.gz $LFS/sources/
COPY src/gcc-pass1 /src
RUN /src/gcc-pass1

COPY sources/linux-4.9.9.tar.xz $LFS/sources/
COPY src/linux-api-headers /src
RUN /src/linux-api-headers

COPY sources/glibc-2.25.tar.xz $LFS/sources/
COPY src/glibc /src
RUN /src/glibc

COPY src/libstdcpp /src
RUN /src/libstdcpp
