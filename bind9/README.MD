# BIND9 based on Debian buster-slim

Provided is a Dockerfile to build DNS server using bind9 and debian buster-slim.
Do you can download and build yourself or you can download by Docker Hub.

## Usage

### Download

```bash
$docker.io pull dungeondragon/bind9
```

### Run

(You need to run with sudo when DNS servers use low port number (<1024))

```bash
#sudo docker run -d \
  --name bind9 \
  -p 53:53/udp \
  -p 53:53 \
  dungeondragon/bind9
```

### Run and create volumes

It's recommended to mount certain files and folders to be able to edit the data easily
The following example will mount the zones folder to put your zone files, and the file named.conf.local that will contain what zones you want to load.

```bash
#sudo docker run -d \
  --name bind9 \
  -p 53:53/udp \
  -p 53:53 \
  -v /path/to/your/named.conf.local:/etc/bind/named.conf.local
  -v zones:/etc/bind/zones
  dungeondragon/bind9
```

