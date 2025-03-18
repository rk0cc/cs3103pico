# Dockerfile for completing CS3103 tutorials

Alpine Linux based images to provide all necessaries environment for completing CS3103 tutorial locally.

## Available tags

* `latest` [![Upload pre-release image to Docker Hub](https://github.com/rk0cc/cs3103pico/actions/workflows/prerelease.yml/badge.svg?branch=main)](https://github.com/rk0cc/cs3103pico/actions/workflows/prerelease.yml): Synchronize content from repository and push to Docker Hub if the image built successfully.
* `<full year><month>` [![Upload stable image to Docker Hub](https://github.com/rk0cc/cs3103pico/actions/workflows/release.yml/badge.svg?branch=stable)](https://github.com/rk0cc/cs3103pico/actions/workflows/release.yml): Images built based on `stable` branch content for each quarters of the year (e.g. `202504` refers to this image built at April, 2025).
    * The image built automatically at the first date in January, April, July and October.

Each image tags delivers the latest dependencies updates.

## Installed dependencies

(Exclude all bundled dependencies from Alpine Linux)

* Python 2
* GNU compilers
    * `gcc`
    * `g++`
    * `make` and `automake`
* (De)compression
    * `xz`
    * `bzip2`
    * `zip` and `unzip`
* `mc`
* `nano`
* `htop`
* `zsh`
    * Default terminal when running in container.
* `man` (Starting from `202504` tags)
    * Alpine Linux does not bundled with documentations when installing packages. Therefore, to get documentations from installed packages, please run `/opt/fetch_manpage.sh` afterward.

## Usage

Simply run this command after the image pulled:

```bash
docker run -it --name "(Container name)" --mount type=bind,src=/path/to/CS3103/src,dst=/mnt/CS3103 rk0d/cs3103pico:latest
```

Then, you can access any CS3103 source codes in `/mnt/CS3103` directory.

## License

AGPL 3

## Links

* [GitHub repository](https://github.com/rk0cc/cs3103pico)
