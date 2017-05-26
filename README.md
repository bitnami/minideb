minideb
=======

[![Build Status](https://travis-ci.org/bitnami/minideb.svg?branch=master)](https://travis-ci.org/bitnami/minideb)
[![Slack](http://slack.oss.bitnami.com/badge.svg)](http://slack.oss.bitnami.com)

# What is Minideb
A minimalist Debian based image built specifically to be used as a base image for containers.

# Use Minideb
You can use the image directly, e.g.
```
$ docker run --rm -it bitnami/minideb:latest
```

There are [tags](https://hub.docker.com/r/bitnami/minideb/tags/) for the different Debian releases.
```
$ docker run --rm -it bitnami/minideb:jessie
```

The images are built daily and have the security release enabled, so will contain any security updates released more than 24 hours ago.

You can also use the images as a base for your own `Dockerfile`:
```
FROM bitnami/minideb:jessie
```

# Why use Minideb
  * This image aims to strike a good balance between having small images, and having many quality packages available for easy integration.
  * The image is based on glibc for wide compatibility, and has apt for access to a large number of packages. In order to reduce size of the image, some packages that aren't required in containers are removed:
    * Packages that aren't often used in containers (hardware related, init systems etc.)
    * Some files that aren't usually required (docs, man pages, locales, caches)
  * These images also include an `install_packages` command that you can use instead of apt. This takes care of some things for you:
    * Install the named packages, skipping prompts etc.
    * Clean up the apt metadata afterwards to keep the image small.
    * Retrying if apt fails. Sometimes a package will fail to download due to a network issue, and this may fix that, which is particularly useful in an automated build pipeline.

    For example:
    ```
    $ install_packages apache2 memcached
    ```

# Adoption of Minideb
The minideb container image is the base image for many Bitnami-maintained language runtimes including
  [php](https://github.com/bitnami/bitnami-docker-php-fpm),
  [nodejs](https://github.com/bitnami/bitnami-docker-node),
  [ruby](https://github.com/bitnami/bitnami-docker-ruby)
  and infrastructure components
  including [mariadb](https://github.com/bitnami/bitnami-docker-mariadb),
  [redis](https://github.com/bitnami/bitnami-docker-redis),
  [nginx](https://github.com/bitnami/bitnami-docker-nginx) and
  [mongodb](https://github.com/bitnami/bitnami-docker-mongodb).

# Compatibility
The image points to the Debian archive, so you are free to install packages from there that you need. However because some `Essential` packages have been removed they may not always install or work correctly.

In those cases you can figure out which package is needed and manually specify to install it along with your desired packages. Please feel free to submit an issue request so that we can reach out and help you quickly.

# Building Minideb
You can build an image yourself if you wish:
```console
### Install debootstrap and debian-archive-keyring.
$ apt-get update && apt-get install -y debootstrap debian-archive-keyring

### Build Minideb
$ sudo ./buildall

### To build an individual image
$ sudo ./mkimage jessie.tar jessie

### Then you can import the tar file to a docker image (ex: minideb:jessie)
$ docker import -t minideb:jessie jessie.tar
```

To test the resulting image:
```
$ ./test minideb:jessie
```

# Contributing
We'd love for you to contribute to this image. You can request new features by creating an [issue](https://github.com/bitnami/minideb/issues), or submit a [pull request](https://github.com/bitnami/minideb/pulls) with your contribution.

# Community
Most real time communication happens in the #containers channel at [bitnami-oss.slack.com](https://bitnami-oss.slack.com); you can sign up at [slack.oss.bitnami.com](http://slack.oss.bitnami.com).

Discussions are archived at [bitnami-oss.slackarchive.io](https://bitnami-oss.slackarchive.io).

# License
Copyright (c) 2016-2017 Bitnami

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
