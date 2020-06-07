FROM debian:buster-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      --no-install-recommends \
      --no-install-suggests \
      postfix

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/*

RUN postconf -e inet_protocols=ipv4 

VOLUME ["/var/log/postfix", "/var/spool/postfix"]

EXPOSE 25

COPY run /usr/bin/run

ENTRYPOINT ["/usr/bin/run"]
