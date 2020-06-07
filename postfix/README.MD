# Postfix based on Debian buster-slim


## Usage

### Download

```bash
docker pull dungeondragon/postfix
```

### Run

```bash
docker run -d \
  --name postfix \
  -p 25:25 \
  dungeondragon/postfix
```

Note: volumes are being created in the Dockerfile as anonomous volumes.
If you want to access the data, access the docker volumes in the filesystem or bind mount with
-v "/your/path:/var/log/postfix" \
-v "/your/other/path:/var/spool/postfix" \

