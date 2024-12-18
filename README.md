# nixconf

My Nix config.

## Prerequisites

- [Nix][determinate-nix]

## Getting started

Download the repository and bootstrap the shell:

```sh
git clone git@github.com:icorbrey/nixconf.git
cd nixconf
nix develop
```

Install a machine's configuration:

```sh
just install <hostname>
```

Validate a machine's configuration and push to GitHub:

```sh
just commit <hostname>
```

Reset to the last committed configuration:

```sh
just reset <hostname>
```

> [!TIP]
> You can omit `<hostname>` if your machine's hostname already matches the
> desired configuration.

## Organization

This repository is sorted into **languages**, **packages**, and **workflows**.
Languages are composed of packages that directly support development using
those languages. Packages are distinct packages that are separate from language
packages, and are organized separately. Workflows are sets of languages and/or
packages to be used together.

## License

My Nix config is provided under the [MIT license][license]

[determinate-nix]: https://github.com/DeterminateSystems/nix-installer
[license]: ./LICENSE.md
