# BIND9 based on Debian buster-slim

Provided is a Dockerfile with example files to build a Bind9 DNS server from debian buster-slim.
You can download and build it yourself or you can download it via Docker Hub. 

The example files are available in the Github repository.

## Usage

### Download

```bash
$docker.io pull dungeondragon/bind9
```

### Run

```bash
docker run -d \
  --name bind9 \
  -p 53:53 \
  -p 53:53/udp \
  dungeondragon/bind9
```

You may test if it works (outside the container) with the command dig.
(DIG is a part of dnsutils package and will need to be installed if not exist.)

```bash
dig example.com @localhost
```

### Run and mount example files

It's recommended to mount certain files and folders to be able to edit the data easily.
The following example will use bind mount to enable easy access to the configuration files supplied in the repository.
Note that you have to replace /absolute/path/to with your own path.

```bash
docker run -d \
  --name bind9 \
  -p 53:53/udp \
  -p 53:53 \
  -v /absolute/path/to/named.conf.local:/etc/bind/named.conf.local \
  -v /absolute/path/to/zones:/etc/bind/zones \
  dungeondragon/bind9
```

