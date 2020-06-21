# Postfix mail server - virtual host
Run a Postfix mail server with one or multiple domains. This Postfix image is configured to work as a virtual mailbox wich means that you don't have to map users to any users of the host machine. Any users are simply added to the configuration file vmailbox.

## Download

```bash
docker pull dungeondragon/postfix
```

## Run

```bash
docker run --name postfix \
  -p 25:25 \
  -p 587:587 \
  -e DOMAINS='domain.com, anotherdomain.org' \
  -e HOST='mx.domain.com' \
  -v /absolute/path/to/vmailbox:/etc/postfix/vmailbox \
  dungeondragon/postfix
```
You have to change /absolute/path/to with your own path to the file.

## Example file of vmailbox 
```bash
info@example.com    example.com/info
sales@example.com   example.com/sales/
# Comment out the entry below to implement a catch-all.
# @example.com      example.com/catchall
...virtual mailboxes for more domains...
```

The example file is from Postfix's own readme file that can be found here:
http://www.postfix.org/VIRTUAL_README.html

## Example of an enviroment file: .env

```bash
#Domains you wish to recieve emails for. One domain or a comma seperated list.
DOMAINS=mydomain.com, myotherdomain.cc
#FQDN of the hosting server. This should correspond to the mx record of your domains.
HOST=mymailhost.com
```
