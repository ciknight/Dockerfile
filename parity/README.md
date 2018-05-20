# Parity

## Build

```shell
sh setup.sh
```

## Run

```shell
docker run -it --name kovan \
    -p 8180:8180 -p 8545:8545 -p 8546:8546 \
    -p 30303:30303 -p 30303:30303/udp \
    parity:1.10 --ui-interface all --jsonrpc-interface all \
    --unsafe-expose --chain kovan
```
