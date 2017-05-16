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
