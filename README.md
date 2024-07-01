<p align="center">
    <img width="400px" height=auto src="https://bitnami.com/downloads/logos/bitnami-by-vmware.png" />
</p>

<p align="center">
    <a href="https://github.com/bitnami/minideb/actions/workflows/main.yml"><img src="https://github.com/bitnami/minideb/actions/workflows/main.yml/badge.svg?branch=master" /></a>
    <a href="https://hub.docker.com/r/bitnami/minideb/"><img src="https://badgen.net/docker/pulls/bitnami/minideb?icon=docker&label=pulls" /></a>
    <a href="https://hub.docker.com/r/bitnami/minideb/"><img src="https://badgen.net/docker/stars/bitnami/minideb?icon=docker&label=stars" /></a>
    <a href="https://github.com/bitnami/minideb"><img src="https://badgen.net/github/forks/bitnami/minideb?icon=github&color=grey" /></a>
    <a href="https://github.com/bitnami/minideb"><img src="https://badgen.net/github/stars/bitnami/minideb?icon=github&color=grey" /></a>
    <a href="https://twitter.com/bitnami"><img src="https://badgen.net/badge/twitter/@bitnami/1DA1F2?icon&label" /></a>
</p>

# What is Minideb
A minimalist Debian-based image built specifically to be used as a base image for containers.

# Use Minideb
You can use the image directly, e.g.
```
$ docker run --rm -it bitnami/minideb:latest
```

There are [tags](https://hub.docker.com/r/bitnami/minideb/tags/) for the different Debian releases.
```
$ docker run --rm -it bitnami/minideb:bookworm
```

The images are built daily and have the security release enabled, so will contain any security updates released more than 24 hours ago.

You can also use the images as a base for your own `Dockerfile`:
```
FROM bitnami/minideb:bookworm
```

# Why use Minideb
  * This image aims to strike a good balance between having small images and having many quality packages available for easy integration.
  * The image is based on glibc for wide compatibility and is apt for access to a large number of packages. To reduce the size of the image, some things that aren't required in containers are removed:
    * Packages that aren't often used in containers (hardware-related, init systems, etc.)
    * Some files that aren't usually required (docs, man pages, locales, caches)
  * These images also include an `install_packages` command that you can use instead of apt. This takes care of some things for you:
    * Install the named packages, skipping prompts, etc.
    * Clean up the apt metadata afterward to keep the image small.
    * Retrying if apt fails. Sometimes a package will fail to download due to a network issue, and this may fix that, which is particularly useful in an automated build pipeline.

    For example:
    ```
    $ install_packages apache2 memcached
    ```

# Adoption of Minideb
The minideb container image is the base image for many Bitnami-maintained language runtimes including [php](https://github.com/bitnami/containers/tree/main/bitnami/php-fpm), [nodejs](https://github.com/bitnami/containers/tree/main/bitnami/node), [ruby](https://github.com/bitnami/containers/tree/main/bitnami/ruby) and infrastructure components including [mariadb](https://github.com/bitnami/containers/tree/main/bitnami/mariadb), [redis](https://github.com/bitnami/containers/tree/main/bitnami/redis), [nginx](https://github.com/bitnami/containers/tree/main/bitnami/nginx) and [mongodb](https://github.com/bitnami/containers/tree/main/bitnami/mongodb).

# Compatibility
The image points to the Debian archive, so you are free to install the packages from there that you need. However, because some `Essential` packages have been removed they may not always install or work correctly.

In those cases, you can figure out which package is needed and manually specify to install it along with your desired packages. Please feel free to submit an issue request so that we can reach out and help you quickly.

# Security
Minideb is based on Debian and relies on their security updates. The images are built daily and have the security release enabled, so will contain any security updates released more than 24 hours ago.

Note that Debian [does not fix every CVE that affects their packages](https://www.debian.org/security/faq#cvedsa), which means that CVE scanners may detect unfixed vulnerabilities in Minideb images. In those cases, you can check the [Debian security tracker](https://security-tracker.debian.org/tracker/) to see whether Debian intends to release an update to fix it.

To keep compatibility with Debian, we will not patch any vulnerabilities in Minideb directly. If Debian does not fix the CVE then it will also remain in Minideb. If you find a vulnerability that is fixed in Debian but not in the latest images of Minideb then please file an issue as that is not intentional.

On [this page](https://docs.bitnami.com/kubernetes/open-cve-policy/), you can find more information about the Bitnami policy regarding CVEs. In the same way, if you find a security issue with how the Minideb images are built or published then please report it to us.

# Building Minideb
We provide a Makefile to help you build Minideb locally. It should be run on a Debian-based machine and requires sudo privileges.
```
$ sudo make
```

To build an individual release (bullseye or bookworm)
```
$ sudo make bookworm
```

To test the resulting image:
```
$ sudo make test-bookworm
```

## Building Minideb for foreign architecture
Make commands shown above will build an image for the architecture you are currently working on.
To build an image for a foreign architecture (for example to build a multi-arch image), we provide a
simple script that runs a QEMU instance for the target architecture and builds the image inside it.

To build and test a bookworm image for arm64:
```
$ ./qemu_build bookworm arm64
```

The image will be then imported locally through the docker CLI with the `$distribution-$architecture` tag
(example: `bitnami/minideb:bookworm-arm64`)

Current limitations of the `qemu_build` script:

- Can be run only on Debian-based distributions
- Support `AMD64` and `ARM64` target architectures only

# Contributing
We'd love for you to contribute to this image. You can request new features by creating an [issue](https://github.com/bitnami/minideb/issues), or submit a [pull request](https://github.com/bitnami/minideb/pulls) with your contribution.

# License

Copyright &copy; 2024 Broadcom. The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
