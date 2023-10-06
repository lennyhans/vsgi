# FROM debian:bullseye-slim
# FROM buildpack-deps:bookworm
FROM debian:bookworm-slim
# MAINTAINER NAME EMAIL

ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes
ENV BASE_DIR=/app/build

WORKDIR /app

RUN apt-get -y update && \
  # apt-get -y upgrade && \
  # apt-get install -y build-essential  && \
  apt-get install -y \
    build-essential meson ninja-build \
    gir1.2-glib-2.0 \
    gir1.2-gee-0.8 \
    gobject-introspection \
    gcc \
    libfcgi-dev \
    libfcgi-bin \
    libfcgi0ldbl \
    libgee-0.8-dev \
    libgirepository1.0-dev \
    valac 
#gcc

RUN addgroup --gid 1001 devcontainer
RUN adduser --disabled-password --gecos '' --uid 1001 --gid 1001 devcontainer

COPY . ./

RUN chown devcontainer:devcontainer -R .
USER devcontainer
ENV PATH=/usr/local/bin:/usr/bin:/bin:

RUN meson setup build
RUN meson compile -C build
