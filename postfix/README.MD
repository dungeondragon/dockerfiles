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
  -v "postfix:/var/spool/postfix" \
  -v "postfix-mail:/var/mail" \
  -v "postfix-log:/var/log/postfix" \
  dungeondragon/postfix
```
### Suppported environment variables to edit the config with postconf

$MY_HOSTNAME
$MY_NETWORKS
$MY_DESTINATION
$VIRTUAL_ALIAS_DOMAINS - will expect you to supply a bind mount to /etc/postfix/virtual
$ROOT_ALIAS
