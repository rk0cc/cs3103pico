# Dockerfile for completing CS3103 tutorials

Alpine Linux based images to provide all necessaries environment for completing CS3103 tutorial locally.

> [!WARNING]
> This Docker image is designed for compiling and running programs in Linux environment locally. The executables are **incompatible** to run in CS Gateway server.
> If you wish submitting executables for assessments, it is preferred to use the gateway server instead.

## Available tags

* `pre` [![Upload pre-release image to Docker Hub](https://github.com/rk0cc/cs3103pico/actions/workflows/prerelease.yml/badge.svg?branch=main)](https://github.com/rk0cc/cs3103pico/actions/workflows/prerelease.yml): Synchronize content from repository and push to Docker Hub if the image built successfully.
* `<YYYY><MM>`, `latest` [![Upload stable image to Docker Hub](https://github.com/rk0cc/cs3103pico/actions/workflows/release.yml/badge.svg?branch=stable)](https://github.com/rk0cc/cs3103pico/actions/workflows/release.yml): Images built based on `stable` branch content for each quarters of the year where `YYYY` and `MM` refers as full year and month in digits accordingly. `latest` tag is referring to the most recent released tag of `<YYYY><MM>`.
    * The image built automatically at the first date in January, April, July and October.

### Postfix tags (`<tag name>-<postfix>`)

* (No postfix): Basic variant that it only offers installed dependencies.
* `-pip`: It offers `pip2` command for installing Python 2 packages
    * It is not recommended to use `pip2` in Python 2 since it has reached end of life at 2020. Therefore, avoid use this postfix if the tutorials or assignments do not require using additional packages.
* `-powershell`: Replace default shell of this image from `zsh` to `pwsh`.

Each image tags delivers the latest dependencies updates.

## Installed dependencies

(Exclude all bundled dependencies from Alpine Linux)

* Python 2
* Python 3 (Since `202507`)
    * `pip3` included
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
* `zsh` (except `-powershell`)
    * Default terminal when running in container.
* `man`
    * Alpine Linux does not bundled with documentations when installing packages. Therefore, to get documentations from installed packages, please run `/opt/fetch_manpage.sh` afterward.
* `valgrind` (Since `202504`)
* `gdb` (Since `202507`)

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
