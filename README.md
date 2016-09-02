minideb
=======

A small container image with apt available.

We want to have the smallest container image possible with
apt available. Small images are great, but the power of
apt is hard to live without.

These images are Debian-based, but they are not Debian, as
they remove some `Essential` packages that are not needed in
most containers (e.g. init). This does mean that while apt
is available, with the whole Debian archive, some packages
will not work correctly without also installing a missing
`Essential` package.

These images also include an `install_packages` command
that you can use instead of apt. This does two things:

  1. Install the named packages, skipping prompts etc.
  2. Clean up the apt metadata afterwards to keep the image small.

Building
--------

- Install debootstrap and debian-archive-keyring.
- sudo ./buildall

To build an individual image:

- sudo ./mkimage jessie.tar jessie

To test the resulting image:

- docker import -t minideb:jessie jessie.tar
- ./test minideb:jessie

Nami
----

Nami from Bitnami allows you to install Bitnami-maintained packages.

The `namibase` directory contains `Dockerfile`s for building images
containing `nami` based on the minideb images. They will also be build
by the `buildall` script. You will first have to download the
`nami-linux-x64.tar.gz` tarball in to the `namibase` directory, but
unfortunately there is no public source for those tarballs currently.

TODO
----

  - Look at whether the process produces the same bits given the same inputs
    - It does not. `/etc/shadow` and `/etc/group` change, as well as `/var/cache/ldconfig/aux-cache`.
  - Can we use a custom debootstrap script to avoid removing packages?
    - Yes, and allows to define a package set to include, rather than a list of packages to remove.
    - Requires to install some packages (e.g. mount) for running the process, that we would still
      want to remove afterwards.
  - `install_packages` to also run the docs/locales/etc. cleanups
