# Dockerfile for completing CS3103 tutorials

Alpine Linux based images to provide all necessaries environment for completing CS3103 tutorial locally.

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

## Usage

Simply run this command after the image pulled:

```bash
docker run -it --name "(Container name)" --mount type=bind,src=/path/to/CS3103/src,dst=/mnt/CS3103 rk0d/cs3103pico:latest
```

## License

AGPL 3
