# nixconf

My Nix config.

## Prerequisites

- [Nix][determinate-nix]

## Getting started

Download the repository and bootstrap the shell:

```sh
git clone git@github.com:icorbrey/nixconf.git
cd nixconf
nix run nixpkgs#just bootstrap
```

Install the configuration for a given machine:

```sh
just install <hostname>
```

Install the configuration for the current machine:

```sh
just install
```

## License

My Nix config is provided under the [MIT license][license]

[determinate-nix]: https://github.com/DeterminateSystems/nix-installer
[license]: ./LICENSE.md
