# docker-drachtio-sipp

A Dockerfile for a sipp image.  This image includes pcap support, but does not include TLS or SCTP support.

## Usage

```bash
$ docker run -ti --name sipp_uac --net=host drachtio/sipp sipp -sn uac 127.0.0.1
```

The image maps the `/scenarios` directory as a location to use for scenario files:

```bash
$ docker run -ti --name sipp_uac --net=host \
   -v ~/sipp/scenarios:/scenarios \
    sipp -sf /scenarios/my-test.txt 127.0.0.1
```



