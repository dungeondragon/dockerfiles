# BIND9 based on Debian buster-slim

Provided is a Dockerfile to build DNS server using bind9 and debian buster-slim.
Do you can download and build yourself or you can download by Docker Hub.

## Usage

### Download

```bash
$docker.io pull dungeondragon/bind9
```

### Run

You will need to use sudo because of the low port numbers.

```bash
sudo docker run -d \
  --name bind9 \
  -p 53:53 \
  -p 53:53/udp \
  dungeondragon/bind9
```

You can test if it works (outside the container) with the command dig:
(DIG is a part of dnsutils package and will need to be installed if not exist)

```bash
dig example.com @localhost
```

### Run and mount example files

It's recommended to mount certain files and folders to be able to edit the data easily
The following example will use bind mount to enable easy access to the configuration files supplied in the repository.
Note that you have to replace /absolute/path/to with your own path.

```bash
sudo docker run -d \
  --name bind9 \
  -p 53:53/udp \
  -p 53:53 \
  -v /absolute/path/to/named.conf.local:/etc/bind/named.conf.local \
  -v /absolute/path/to/zones:/etc/bind/zones \
  dungeondragon/bind9
```

### Run and create volumes

For better backup options and store handling than mount bind use volumes.
The following example will create Docker volumes for each folder specified.

 ```bash
sudo docker run -d \
  --name bind9 \
  -p 53:53/udp \
  -p 53:53 \
  -v bind:/etc/bind/ \
  -v zones:/etc/bind/zones \
  -v cache:/var/cache/bind \
  dungeondragon/bind9
```

To list the volumes run 
 
```bash
docker volume ls                   
 ```

