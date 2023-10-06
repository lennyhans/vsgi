Vala Server Gateway Interface
=============================

The Vala Server Gateway Interface (VSGI) is a library for developing middleware
for Vala and GObject based web applications.

## Requirments
- `valac >= 0.16` __build only__
- `meson >= 2.3` __build only__
- `glib >= 2.32`
    - glib-2.0
    - gobject-2.0
    - gio-2.0
- `gee-0.8 >= 0.6`
- `libfcgi >= 2.4.0`

## Build
VSGI uses the meson build tool.
To configure, build, and install simple do the following:

    meson setup build
    ninja -C build

## Hacking
To build and run the example from the project directory run

    ./build/examples/vsgi-example
