minideb
=======

A small base image designed for use in containers. The image
is based on glibc for wide compatibility, and has apt for
access to a large number of packages. The image is based
on Debian, with some things that aren't required in containers
removed:

  * Some packages that aren't often used in containers
    (hardware related, init systems etc.)
  * Some files that aren't usually required (docs, man pages,
    locales, caches)

This image aims to strike a good balance between having
small images, and having many quality packages available
for easy integration.

These images also include an `install_packages` command
that you can use instead of apt. This takes care of some things
for you:

  1. Install the named packages, skipping prompts etc.
  2. Clean up the apt metadata afterwards to keep the image small.
  3. Retrying if apt fails. Sometimes a package will fail to download
     due to a network issue, and this may fix that, which is
     particularly useful in an automated build pipeline.

e.g.

    $ install_packages apache2 memcached

Compatibility
-------------

The image points to the Debian archive, so you are free to
install packages from there that you need. However because
some `Essential` packages have been removed they may not
always install or work correctly.

In those cases you can figure out which package is needed
and manually specify to install it along with your desired
packages.

Docker
------

You can use the image directly, e.g.

    $ docker run --rm -it bitnami/minideb:latest

There are tags for the different Debian releases.

    $ docker run --rm -it bitnami/minideb:jessie

The images are built daily and have the security release enabled,
so will contain any security updates released more than 24 hours
ago.

You can also use the images as a base for your own `Dockerfile`:

    FROM bitnami/minideb:jessie

Building
--------

You can build an image yourself if you wish:

- Install debootstrap, devscripts and debian-archive-keyring.
- sudo ./buildall

To build an individual image:

- sudo ./mkimage jessie.tar jessie

To test the resulting image:

- docker import -t minideb:jessie jessie.tar
- ./test minideb:jessie
